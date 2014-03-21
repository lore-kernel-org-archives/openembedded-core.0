Return-Path: <paul.betafive@gmail.com>
Received: from mail-ve0-f176.google.com (mail-ve0-f176.google.com
	[209.85.128.176])
	by mail.openembedded.org (Postfix) with ESMTP id 24D876FA18
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Mar 2014 12:35:04 +0000 (UTC)
Received: by mail-ve0-f176.google.com with SMTP id cz12so2469495veb.35
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Mar 2014 05:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:from:date:message-id:subject:to:content-type;
	bh=KJYEkQaNKyUZ52QNA6PKXcLNOwqmZiYvI0O4jKZDJ8o=;
	b=RZakvEnih9UDg99OoQTcllavCM8OOJuxAznaiXxTS64hbDjqbY6ODSDu1w0F0/dWJ4
	HYwPHhmWNYZ/Ui9zpR0GIuEM9vzmcu0pepcWohX8rTNnrDvMQry2TtQ2OOvfPSS5uVAP
	MFLntdnssnjLeQ77tcq8XAtvnGH61RN7AZhBuUNEZ2tVS/m7DW0JRIdqH7at0Vgt1LgA
	dkFSadzH2ra3tq756AMVUke96xZmyCj/BdlvJv5wntIM4aO+Ls7ZGJcwbreq8l7ryTFE
	2T0gu149iXR1qgFV29kNnd7eghZw9zCSD243OOiyQoziXeZZ5x8bSDvMgutFnMK7bwEC
	0xVA==
X-Received: by 10.52.170.16 with SMTP id ai16mr63317vdc.69.1395405305133; Fri,
	21 Mar 2014 05:35:05 -0700 (PDT)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.220.239.135 with HTTP; Fri, 21 Mar 2014 05:34:24 -0700 (PDT)
From: Paul Barker <paul@paulbarker.me.uk>
Date: Fri, 21 Mar 2014 12:34:24 +0000
X-Google-Sender-Auth: XQjc9vVFZC8TYMlbdfsI21ZCpgw
Message-ID: <CANyK_8e6dfzu64SRLzZdXFE3obT6Td-8UUDqfcoSAqWTjoOq3g@mail.gmail.com>
To: Yocto discussion list <yocto@yoctoproject.org>, 
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: OpenEmbedded and musl-libc
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
X-List-Received-Date: Fri, 21 Mar 2014 12:35:07 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi all,

musl-libc hit version 1.0.0 yesterday and is starting to look good to
me. It's basically a really small but very functional libc that would
suit embedded environments very well as an alternative to
eglibc/uclibc. I'm personally very interested in using it in my
projects and I also think it could fit in well with the aims of
poky-tiny.

http://www.etalabs.net/compare_libcs.html gives some pretty useful info.

I'm basically emailing to see if anyone else is interested in this or
if anyone has looked at using it before in OpenEmbedded as a google
for previous discussions didn't turn anything up.

I'm currently very busy between various projects so I don't have time
to hack together a musl-libc recipe myself but I should have time to
help test it.

Thanks,

-- 
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

