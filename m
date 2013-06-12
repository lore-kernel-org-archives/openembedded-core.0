Return-Path: <tasskjapp@gmail.com>
Received: from mail-la0-f43.google.com (mail-la0-f43.google.com
	[209.85.215.43])
	by mail.openembedded.org (Postfix) with ESMTP id 3FCC66A957
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2013 06:19:20 +0000 (UTC)
Received: by mail-la0-f43.google.com with SMTP id gw10so7618124lab.16
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2013 23:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=8MEvNnB3jmurTSCTPv3TNK7XvbCpMTJEyJu2NzzKrS4=;
	b=w7F4FbI25LAlapwotoIF/8+lZQOFdSGqwChVcK8fhNsXM5YdGe08TI3gr8GWUKDmBP
	YsZ7O31q5VGGHzmr4GKeLCWF/OZxTsgQSCHCiAI8Zrc9ixnAPuT5/Xn7a7pxFI+L9JOf
	2gaWoakGLAiQ4AvrjmWHyHIesUm3nMpotWt27QrUgLY4OCmyV6f7i4BuItp3mr6GOOA1
	Z/av8+QX7MxIJavAOGJ4kEjQZ+URU8c4v2oi8BrOsII+Lh/TekNE35BeNziS3VMj48Eb
	lvZ8+FTeCa7L1SQ5SLtvO4OjwYN+esGjV41WWhaMgySyGEPhSyD1NJwpk005oRccEBe3
	HI6A==
X-Received: by 10.112.166.67 with SMTP id ze3mr10377316lbb.25.1371017575672;
	Tue, 11 Jun 2013 23:12:55 -0700 (PDT)
Received: from [192.168.0.209] ([77.40.182.98])
	by mx.google.com with ESMTPSA id w4sm2426741law.5.2013.06.11.23.12.54
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 11 Jun 2013 23:12:54 -0700 (PDT)
Message-ID: <51B81165.40000@gmail.com>
Date: Wed, 12 Jun 2013 08:12:53 +0200
From: Tasslehoff Kjappfot <tasskjapp@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130510 Thunderbird/17.0.6
MIME-Version: 1.0
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
References: <51B6EF5E.1020404@gmail.com> <20130611124350.GD7181@lpalcu-linux>
	<51B7219D.7070703@gmail.com> <20130611132417.GE7181@lpalcu-linux>
In-Reply-To: <20130611132417.GE7181@lpalcu-linux>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: SDK relocation issues
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
X-List-Received-Date: Wed, 12 Jun 2013 06:19:20 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/11/2013 03:24 PM, Laurentiu Palcu wrote:> On Tue, Jun 11, 2013 at 
03:09:49PM +0200, Tasslehoff Kjappfot wrote:
 >>
 >> I have time for one more :)
 >>
 >> What does it mean that the SDK is relocatable? That I can choose
 >> when I run the .sh where I want to install it? Is it then "bound" to
 >> that directory, so that every dev that wants to use the SDK have to
 >> run the installer on their machine?
 >
 > That's correct. Each developer can install the SDK wherever he/she wants
 > to.
 >
 >> Maybe my "I can copy it wherever
 >> I want" interpretation of relocatable is the problem :)
 > Indeed, that's causing the issue. :)
 >
 >>
 >> The DL is shipped with the toolchain, but is looked for in the path
 >> I installed to when I run the .sh. If I move the entire folder, I
 >> get the problems.
 > When the relocation process takes place, it changes the path to the
 > dynamic loader in all binaries. Moving the SDK to another location would
 > imply re-running the installer again and choose the new location as
 > destination.
 >

Thanks for explaining this. The reason we did it the way I described is 
that when checking out older source we would automatically get the 
toolchain we used at the time. Not sure how to solve this now, but I 
guess keeping multiple toolchains installed will work. Any other 
suggestions?

Regards,
Tasslehoff


