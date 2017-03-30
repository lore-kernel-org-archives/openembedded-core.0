Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 3544577BDF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 16:13:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTP id v2UGCxoX018555; 
	Thu, 30 Mar 2017 17:12:59 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id YxzDKeiw1vho; Thu, 30 Mar 2017 17:12:59 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v2UGCv06018550
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 30 Mar 2017 17:12:58 +0100
Message-ID: <1490890377.13980.364.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Francisco Pedraza <francisco.j.pedraza.gonzalez@intel.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 30 Mar 2017 17:12:57 +0100
In-Reply-To: <1490807554-33473-2-git-send-email-francisco.j.pedraza.gonzalez@intel.com>
References: <1490807554-33473-1-git-send-email-francisco.j.pedraza.gonzalez@intel.com>
	<1490807554-33473-2-git-send-email-francisco.j.pedraza.gonzalez@intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH v4 2/2] meta/classes/populate_sdk: Adds support for generating eSDK manifest files
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 30 Mar 2017 16:13:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2017-03-29 at 10:12 -0700, Francisco Pedraza wrote:
> The functionalities to generate SDK and eSDK manifest files are
> different,
> the SDK comes from package information and the eSDK comes from sstate
> artifacts.
> Only execute write_sdk_{host, target}_manifest when is on
> populate_sdk class.
> 
> Adds new functions write_sdk{host, target}_ext_manifest to execute on
> postprocess
> in populate_sdk_ext because at the end we have all the sstate
> artifacts to generate the manifest.
> [YOCTO #9038]
> 
> Signed-off-by: Francisco Pedraza
> <francisco.j.pedraza.gonzalez@intel.com>

Whilst this works to a point, the minimal eSDK doesn't contain sstate
objects so I'm not sure this is actually going to work in that case? We
could always used the locked-sigs.inc file to act as an idea of what
the eSDK contains?

Also, your patch only considers MULTIMACH_TARGET_SYS and TARGET_SYS
architectures and we also have allarch and machine specific packages it
would miss.

Cheers,

Richard

