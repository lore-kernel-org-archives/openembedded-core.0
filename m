Return-Path: <jatedev@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1A68C04A68
	for <webhook@archiver.kernel.org>; Thu, 28 Jul 2022 16:08:58 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web10.34512.1659024537255059874
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Jul 2022 09:08:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qtsj/7CP;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: jatedev@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id
 d65-20020a17090a6f4700b001f303a97b14so2651238pjk.1
        for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Jul 2022 09:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=kV6I12g0z9wy92g95SyK64WAsIPZ0aHbacBDIB+mEBc=;
        b=qtsj/7CPiRBLysn1NZfV9N9N6W3HyzPuHq/9+3aI7RZoT7zhbhkkiUm0rxc83vRM1d
         qxoXUXHujPZervfat5oC6PiN3FKk5fROspamRzvOr0ZwtzhBmQVCiHKUrdZOSNiLmqj5
         K4ZdWpEuIobfLcrLCtjlA/G/S02MioGi1mU+18sOxqik2TLI4BgugQa0nJwpbjxu0p98
         XZP+WycGM7gcMuoMmNeeeg3oqis76+e3R0bQAqmBU2syXnkZMAcVy1ZJiF+LYk++hk++
         Lv7TBHMTvxZJRy+0UiCZ3SN5yf9PQPEdAbOXYL9kn57NRW7I8faXB62pPcyca7q9TlOt
         1o3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=kV6I12g0z9wy92g95SyK64WAsIPZ0aHbacBDIB+mEBc=;
        b=O2mIFFp8NNoMTVxvU3VigtIKTHQoZAfrAMr3gxS8cVU9ky2vFCP90ihXqZd7LlcIZy
         fqiifjBzI6tAM8qrUEVKuTh52kSnBW/YFk0m0D9fOV9OhJbTKTjjG49hrMvVobzY9RN1
         1efSbH3j4HLy6GJSPSob2y9lOgzw2XaYu/khj8ptIjpEBv+RnkSzdnj8bFjwYr2ABmy3
         6tIEthbIfPSCzc7lFjiAAyx0Vmiu+22PIF28m0n9xPOWYDb/ZhrLBN41RdLkNxwuOaAB
         saGCdnijpq8ITr7znxrU0KCeIOLyRqNuqTrZOYaDt1famjs0n47RUMUHECCRY47EH0CI
         ukCQ==
X-Gm-Message-State: AJIora84UPVzH2qZ5q3Jvirnu9vqrtNLhnRwsBfZ23oTXjXBzVpEnQYR
	niRe0UMgnqmfwrInSDPWQxsPGEAWDZrB6YYSS89HWFaImqw=
X-Google-Smtp-Source: 
 AGRyM1uHVWb62gnlEWWrEmT1Ecy24DPvguOrl1+BH07tcNEkwjVgPWhfah900S/YSLQvhYbo3Ij+NYJXCjpUY691bn0=
X-Received: by 2002:a17:902:d48f:b0:16d:4b2e:e2a2 with SMTP id
 c15-20020a170902d48f00b0016d4b2ee2a2mr26878150plg.77.1659024536245; Thu, 28
 Jul 2022 09:08:56 -0700 (PDT)
MIME-Version: 1.0
From: Jate Sujjavanich <jatedev@gmail.com>
Date: Thu, 28 Jul 2022 12:08:44 -0400
Message-ID: 
 <CAPphmgbrgst=vg2OrGZXY7HvPfNU=68ehuiQX_1dKY5+9z7BoA@mail.gmail.com>
Subject: Hash Equivalency Server
To: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000281afc05e4dfc051"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Jul 2022 16:08:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168610

--000000000000281afc05e4dfc051
Content-Type: text/plain; charset="UTF-8"

I would like to use the read-only hashserv with a dunfell build. To test, I
created one based on kirkstone and built the dunfell image using that
hashserv creating a new sstate-cache.

Then, I created a read-only hashserv which used the database of that first
hashserv instance. I started a new build which used the read-only hashserv
and sstate-cache as a PREMIRROR. It required a rebuild of several packages,
and the build printed out warnings like the following:

WARNING: initscripts-1.0-r155 do_populate_lic: Error contacting Hash
Equivalence Server 127.0.0.1:18686: Connection closed
WARNING: initscripts-1.0-r155 do_deploy_source_date_epoch: Error contacting
Hash Equivalence Server 127.0.0.1:18686: Connection closed

The read-only hashserv reports messages like the following:

Unrecognized command {'report': {'taskhash':
'4c79c264282b9bbe444bf9da101e889187a38287711ad09995279b10d19a52a1',
'method': 'oe.sstatesig.OEOuthashBasic', 'outhash':
'be486a087ff983999e0db3e5b4d8b1657b4c849d44202a2abf5d32e9a6ade11a',
'unihash':
'4c79c264282b9bbe444bf9da101e889187a38287711ad09995279b10d19a52a1'}}

Is this how I should do it? After reviewing the hashserv code, I think my
dunfell hashserv client might not handle a read-only hashserver properly,
so it prints those warnings. Do you agree?


Thanks,
Jate S.

--000000000000281afc05e4dfc051
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I would like to use the read-only hashserv with a dun=
fell build. To test, I created one based on kirkstone and built the dunfell=
 image using that hashserv creating a new sstate-cache.<br></div><div><br><=
/div><div>Then, I created a read-only hashserv which used the database of t=
hat first hashserv instance. I started a new build which used the read-only=
 hashserv and sstate-cache as a PREMIRROR. It required a rebuild of several=
 packages, and the build printed out warnings like the following:</div><div=
><br></div><div style=3D"margin-left:40px">WARNING: initscripts-1.0-r155 do=
_populate_lic: Error contacting Hash Equivalence Server <a href=3D"http://1=
27.0.0.1:18686">127.0.0.1:18686</a>: Connection closed</div><div style=3D"m=
argin-left:40px">WARNING: initscripts-1.0-r155 do_deploy_source_date_epoch:=
 Error contacting Hash Equivalence Server <a href=3D"http://127.0.0.1:18686=
">127.0.0.1:18686</a>: Connection closed</div><div><br></div><div>The read-=
only hashserv reports messages like the following:</div><div><br></div><div=
 style=3D"margin-left:40px">Unrecognized command {&#39;report&#39;: {&#39;t=
askhash&#39;: &#39;4c79c264282b9bbe444bf9da101e889187a38287711ad09995279b10=
d19a52a1&#39;, &#39;method&#39;: &#39;oe.sstatesig.OEOuthashBasic&#39;, &#3=
9;outhash&#39;: &#39;be486a087ff983999e0db3e5b4d8b1657b4c849d44202a2abf5d32=
e9a6ade11a&#39;, &#39;unihash&#39;: &#39;4c79c264282b9bbe444bf9da101e889187=
a38287711ad09995279b10d19a52a1&#39;}}</div><div><br></div><div>Is this how =
I should do it? After reviewing the hashserv code, I think my dunfell hashs=
erv client might not handle a read-only hashserver properly, so it prints t=
hose warnings. Do you agree?</div><div><br></div><div><br></div><div>Thanks=
,</div><div>Jate S.<br></div><div><br> </div></div>

--000000000000281afc05e4dfc051--

