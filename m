Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 92C80766A3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Sep 2015 21:58:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t8QLw9Y6007952; Sat, 26 Sep 2015 22:58:49 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id J2cMshIMlnBv; Sat, 26 Sep 2015 22:58:49 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t8QLwa5d008020
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 26 Sep 2015 22:58:48 +0100
Message-ID: <1443304716.19044.223.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Pascal Bach <pascal.bach@siemens.com>
Date: Sat, 26 Sep 2015 22:58:36 +0100
In-Reply-To: <1443111005-20485-1-git-send-email-pascal.bach@siemens.com>
References: <1443111005-20485-1-git-send-email-pascal.bach@siemens.com>
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] runqemu: don't complain about conflicting machines if they are equal
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
X-List-Received-Date: Sat, 26 Sep 2015 21:58:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2015-09-24 at 18:10 +0200, Pascal Bach wrote:
> When the MACHINE variable was set as an environment variable, via
> "export MACHINE=qemuarm" and runqemu was executed as "runqemu qemuarm"
> 
> The confusing error message appears:
> Error: conflicting MACHINE types [qemuarm] and [qemuarm]
> 
> This checks if the two values are equal, in that case there is no problem
> and execution can continue.
> 
> Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
> ---
>  scripts/runqemu | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  mode change 100755 => 100644 scripts/runqemu

I appreciate the patch but we didn't spot the above mode change which
just cost us a bit of time on the autobuilder :(. 

I've removed it from the patch.

Cheers,

Richard



