Return-Path: <geiseri@geekcentral.pub>
X-Greylist: delayed 942 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 30 Aug 2016 14:30:26 UTC
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
	[74.201.84.163])
	by mail.openembedded.org (Postfix) with ESMTP id 930AD605B3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2016 14:30:26 +0000 (UTC)
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=zoho; d=geekcentral.pub; 
	h=date:from:to:message-id:subject:mime-version:content-type:user-agent; 
	b=FSSfzIb22EZuS7UzUKrdVd23Jsdgm1glI2WIEvGqZltpdI2qJgnkh6QtzL195cZfrOXgnlSIBAg0
	w7AiE9Vqbeho29Cg3KUup9qLpk5+QY+gFVBUCdt+zgKaQMC8do8qba7nQiO+9XvVZjVpwYUVItDw
	amWom4hWKjkSek/2KCA=  
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1472566432310955.021675135504;
	Tue, 30 Aug 2016 07:13:52 -0700 (PDT)
Date: Tue, 30 Aug 2016 10:13:52 -0400
From: Ian Geiser <geiseri@geekcentral.pub>
To: "openembedded-core" <openembedded-core@lists.openembedded.org>
Message-ID: <156dbcc9234.fecba7bb134253.7144318255325985625@geekcentral.pub>
MIME-Version: 1.0
X-Priority: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
Subject: Cannot build any external kernel modules in krogoth
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
X-List-Received-Date: Tue, 30 Aug 2016 14:30:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Greetings,  I have an issue where I cannot seem to build any external kernel module recipes.  The one in particular is iscsitarget, but it seems none of them build now.

It seems that what is happening is that the "work-shared/*/kernel-build-artifacts" is getting erased right before the module recipe tries to use them.  Has anyone seen this before?

As a key point, I am also using my own kernel recipe that only uses the kernel.bbclass, not the kernel-yocto.bbclass.  Is there magic I am missing that will not allow me to build modules unless I am using the yocto kernels?

Thanks!







