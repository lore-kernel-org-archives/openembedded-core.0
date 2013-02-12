Received: from mail-oa0-f46.google.com ([209.85.219.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>)
	id 1U5JE4-0003lF-Ua; Tue, 12 Feb 2013 18:01:03 +0100
Received: by mail-oa0-f46.google.com with SMTP id k1so295386oag.5
	for <multiple recipients>; Tue, 12 Feb 2013 08:44:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=CXdbr2/HYHXJP1puefWVmsGrcrrNGRJJ03d9QnOnP4o=;
	b=hh3mFQDnyjl25RmRZvgmbDgNSl7TNX9ZiP1u2Nz908ZbxXEcXEPYYlWi2cvm90BzcH
	683HIVMoQzPMcN4OyMzV6/QLQx2mrL2hn/4Y9s1obXk0NpjcVMxcmhtAEDdkHyl4zObn
	JVI5bJN6vuFzrc11VUM2vfzXnOnL0EeBDcvCl3NmQXsMFzQilfZ/f+Wk/YV7xCkM2KsH
	ZmvUn5PjlUrVX/RDjcPsaEUOaI39kTqV4cus/lpkKDr19X9y6aEIw2Z6Nyzu5mDPWc9X
	7IbHTg2J6ECA79SyFjD/QhWOU+k1rJ8Gr6CmmDvVifOfFMmFVONt9lKlgy5fFBgOzpWV
	o12A==
MIME-Version: 1.0
X-Received: by 10.60.171.102 with SMTP id at6mr14398679oec.60.1360687499081;
	Tue, 12 Feb 2013 08:44:59 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.2.197 with HTTP; Tue, 12 Feb 2013 08:44:58 -0800 (PST)
In-Reply-To: <42BE8E82E93F46829E80D29E6DF4934B@intel.com>
References: <2760168.9kFd94gL1F@helios>
	<CAJTo0LaJNDB6XjK0M4rsS9+z7AZ6K_n0TAX8+7KH2GuAADgCZw@mail.gmail.com>
	<42BE8E82E93F46829E80D29E6DF4934B@intel.com>
Date: Tue, 12 Feb 2013 14:44:58 -0200
X-Google-Sender-Auth: Nqi0LQiUS5vIVvc3NxABTELrmOA
Message-ID: <CAP9ODKoX7NLK_MYKEFXVCrk-FDg5RKnfZCxpOxXhP52et2jgjg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Ross Burton <ross.burton@intel.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe] RFC: meta-oe appends and overlayed recipes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 12 Feb 2013 17:01:07 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Feb 12, 2013 at 1:50 PM, Ross Burton <ross.burton@intel.com> wrote:
> On Tuesday, 12 February 2013 at 10:24, Burton, Ross wrote:
>> > * meta-oe/recipes-extended/polkit/polkit_0.104.bbappend
>> > Another bbappend apparently for systemd support. Again, this should have been
>> > moved to meta-systemd; do we now need to merge it into OE-Core?
>>
>>
>> Yes, half of it has been merged to master already. The rest should be
>> in Radu's branch, we can sort that today.
>
> I take that back - polkit in oe-core supports systemd if enabled, so this append can be removed.

In fact we cannot drop the bbappend or we break the upgrade path
(except if we bump PR in OE-Core to keep it).

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


