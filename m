Return-Path: <koansoftware@gmail.com>
Received: from mail-ee0-f46.google.com (mail-ee0-f46.google.com [74.125.83.46])
	by mail.openembedded.org (Postfix) with ESMTP id 1397260889
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 May 2014 14:16:50 +0000 (UTC)
Received: by mail-ee0-f46.google.com with SMTP id t10so1816732eei.19
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 May 2014 07:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:reply-to:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	bh=MluToyL34ZqUwc36Rvz5R0NqnMEdTbuvATp0db4d31M=;
	b=VtwuXs6JSUIJU7U0N2lA4r1fogtez/BDQbW+TIBnBp7VNwtXOxbk24OGGDctyvLErK
	G4dBTDYQC9qaFHVvoU/LOPp929GSHqIQAyCGTc9lhTS0TKGQzD2DcprYkr677r3+VA2Q
	trwZLVUnOOHcPKpCO8wOtJjMazpF0FgjH/pokHvqrKvK7GRY3DEvUN4sGe4Y9R/uCwqz
	S/Zj2ftCv7yzloqd2HEq2JSUZuEZY/6OOeiQLIw8rf+KGPV5SdAN+PqDnsqJoK62/umc
	9LVoCdJhQzO/Y1mSJ9OpwHfyhBGqu/jWl2XgTwOBy9Xgmg3fYivFhOG9uaFi64gfz1uz
	OlLA==
X-Received: by 10.15.42.138 with SMTP id u10mr32784842eev.7.1399299410980;
	Mon, 05 May 2014 07:16:50 -0700 (PDT)
Received: from [192.168.0.5]
	(host56-7-static.30-87-b.business.telecomitalia.it. [87.30.7.56])
	by mx.google.com with ESMTPSA id t4sm29972645eeb.29.2014.05.05.07.16.48
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 05 May 2014 07:16:49 -0700 (PDT)
Message-ID: <53679D4E.6060202@gmail.com>
Date: Mon, 05 May 2014 16:16:46 +0200
From: Marco <koansoftware@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
Subject: Upgrade to a package with all its dependency without network
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: koansoftware@gmail.com
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 05 May 2014 14:16:52 -0000
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit

Hello,
I need to be able to upgrade to a package with all its dependency chain 
on a target system that does not have access to the network.

I'm trying to understand what may be the best and also the simplest 
solution.
Perhaps there is already this functionality in OE/Yocto?

I thought to implement a new opkg feture so that I can to generate the 
list of dependencies of a package and then extract the packages from 
OE/Yocto using a script or an application.

Another possibility would be to extend the operation of bitbake so I 
pull out the package and dependencies putting them in a dedicated 
directory to be moved on the target for the update.

For now I'm just analyzing what may be the possibilities and I'd love to 
have any comments or advice from someone more experienced than me on 
this topic.

Thanks
-- 
Marco Cavallini | KOAN sas | Bergamo - Italia
  embedded and real-time software engineering
Phone:+39-035-255.235 - Fax:+39-178-22.39.748
       http://www.KoanSoftware.com

