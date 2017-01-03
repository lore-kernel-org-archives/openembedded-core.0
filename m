Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id D9CAE60621
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Jan 2017 11:49:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v03Bn7Pa009916; Tue, 3 Jan 2017 11:49:07 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id DhraeBudxPAp; Tue,  3 Jan 2017 11:49:07 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v03Bn4jL009913
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 3 Jan 2017 11:49:05 GMT
Message-ID: <1483444144.4367.48.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Geoffrey Levillain <geoffrey.levillain@smile.fr>,
	openembedded-core@lists.openembedded.org
Date: Tue, 03 Jan 2017 11:49:04 +0000
In-Reply-To: <20170103111203.25132-1-geoffrey.levillain@smile.fr>
References: <20170103111203.25132-1-geoffrey.levillain@smile.fr>
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
Subject: Re: [PATCH 1/1] image.bbclass: reactivate do_fetch, do_unpack and do_patch
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
X-List-Received-Date: Tue, 03 Jan 2017 11:49:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2017-01-03 at 12:12 +0100, Geoffrey Levillain wrote:
> Running fetch/unpack/patch can be used to get some image-specific
> configurations files to apply with a function in the
> ROOTFS_POSTPROCESS_COMMAND variable.
> 
> Hence delete the "noexec" line corresponding to these tasks so we can
> run them when needed.

You could make this argument for the other noexec lines too and nothing
does this by default as far as I'm aware. Could you not do something
like:

python () {
    d.delVarFlag("do_fetch", "noexec")
}

in your specific recipes which need this?

Cheers,

Richard

