Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18423.1793384583868041606
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 11:23:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=CyCfaG6H;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=mVEO7TdN;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.145, mailfrom: paul@pbarker.dev)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id D4011EC0187
	for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 14:23:02 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Fri, 30 Oct 2026 14:23:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1793384582; x=1793470982; bh=4d
	syN8v0FNni+e99uStUIuzugLdpdhokJTNUIAUcwKU=; b=CyCfaG6HKdXpiELEft
	dejdYAyXxTUFEzrQqC301TeuI6EVKNDV9qeHtHXG7GLNTicGEOdtC/5qMwOQX//g
	PcCV33/ykv4kF5tYreLM7r800PbROiegjdTuj0QXggEewTBDTfTgZah0RKfsFE1C
	ZfKaeK50pkTjl5glPjvNMWcKU08Xzf4Q6pZqnAqFztfGiaVvkTXuQUwnR78TFRRH
	TbKtOdoUe1LtbZR3MwBluYEGqA2+owmtwIdegMXVHyYL+X1GMH2jDVJV6EIDPVDD
	HJpTB5M/6lKmtm7x7btCrjcadN+Ua78rm6cWa4cW2304VeJgscgBWNmi2Hkg3iiG
	C+Hg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1793384582; x=1793470982; bh=4dsyN8v0FNni+e99uStUIuzugLdp
	dhokJTNUIAUcwKU=; b=mVEO7TdNjlDiJlkCALQPH0rvvLBxgWAEUNq/mc5zRLxZ
	y+b13IxEbRfOjZzh/y8B+ZjeEJTenSVOCMcia1j5Bl5cyFSua9qd2Xxmks280DFH
	07GXU05MAOTWNsRdjKkT20UrEazYN947L3kYosHWXF/o4oI7JD6DCys9WxXN3B/C
	m9+VegJeqFQkao51v6V2pX24ifsvSBCxdukboyLRp1oBaQpV9cbWuXsNzRKKZOkw
	AtPlSiB0QkRg2npicEIejscj+Qt0FHW2pvdMsCtmw03mhMhli2n0rXvnPE9q+L6i
	u9GyQPHenAXLdmE4fS0mHbLkXHJswmvRmrvev5nVyQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=pbarker.dev a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793384582; d=pbarker.dev;
	mf=PHBhdWxAcGJhcmtlci5kZXY+;
	rt=PG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+;
	s=fm1:rsa-sha256:KieLdVmHsiJXTPKd88PczA6zJaoySo+2IXIbM0K4Xyf0OZV
	6/RZSC/unYneCN4I6lslUoN/5503SssCwFlBzWllMdrknLScwtP0orN/Fg0NpFSc
	zQbx00W+kXtiJIXZMyOx19/Anxo7DI2J+I1ZVG/nlUh42LGdjgH1Nxjkgo19Rgkt
	TzsLYh6FjDP2aZFzVZ1El1NDNEv6xryxTATvq48xvbItV7l6qqv6pIcWfmbdoS+P
	znYa/Cyfg7ZoBWPU//ouifURh+4HMHJAlpF0OmEwmoCMm9O0VwiLD6bXEKdTPNsx
	QGeIpo0SEyrbzAn0P4Q+0xjqD7Hb0mBB88s4fOA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=10;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:0TBxkGVWkKHo/xxxgUxpHP/aYQ2KZTP4DNz1Nfl+EDA=:Of9+d6oqI9rYbzc0S0oV2ZRDAGNASRb4mVO60c2zxPw=;
X-ME-Sender: <xms:huDkajyeEaDboKHk2cPLdRhcXrSME7IVLjkbbXWKGT7iGPkORWhN2Q>
    <xme:huDkahTnjbuFL_GEGV3XWjHdJdGqRY2a4lBSgHSWMNucgiqg24AYoC8XqsSl-gBYu
    Hz_OmC88r1atXACDS9uOp15k1G7Ntc9P49VIfEDAyQALFFkDiFHfLHo>
X-ME-Received: <xmr:huDkaq9RwOuAFwsIKMC0WvtilWkKjeqtsAcaY5gcwnHhMbzcznFAsHwl1Izw_3LdaBMgr3mLVTuAEMWbUJbGQh8kC4oXKaU>
X-ME-Proxy-Cause: dmFkZTEZQn8aSb5q/9tbN5WJqCSN8xlm2AL6porwdqiZMB59zi+bWpaCkgoEud67px32tc
    IsqVVKaquPCfKemzanhQVCsRFzgxD7FePxZnoy3aI/f8bbai+CB71p+zuL+iY/Oa6Js5hq
    FIzOm5cLqTSUOLBGZ6o6yQipTcgSRonAzG2ST3wB/0M4JavaF8y0g8uCQvYnAaZLWxZszA
    RNVbaucP6Ljzm270fYOoej6fteqZqaA5bY5dO/IEHQXjLdcpt0mlfZhaTkuI89vlcXsAKC
    GGs7Y0octrK1VE808EZWkSec+7nqHRDLq/LE5oR5DNzHGho9vQsAeEF0hWj4tSYmW4O3Q4
    ANHToSJM22zupFzFGmZj2/AtBy8PPwNwh0hbGnYF4E/cLFqllWeyKTwZQNeEqB5/EesAD7
    qqhHxcEKOxhXJD0O4K3SDEDlqx1+ssLKaJJMFAU7yVMcu6AzqypZB/GGBrDS2E7WwPg/Nh
    L2SmMsG2vTSvj4f8eR1BRQr8PFyuYV/yLMtvGdj+QMeFeewAnYl8fhe9QIJbbI5mwol/yc
    Tazplz9+qcV244PjtWgv4lT55I6ShBdyfxHM0xs7EVotk5R2sSczu0HtfErYIIMQHVf6QE
    qUNfBvy52ExeMqGkKMJ6IlZKoNsU4uJh2qX1RVjCfDZ+2ufdbSzM6kwtpBNg
X-ME-Proxy: <xmx:huDkaopKdGE7PQLy94urRAQe7G56HygdNx9SOgbFj5qNZXicyTKTZA>
    <xmx:huDkank2ekbC4DPLxvz2QwkeUkwSmCICxvYd844J491eQD8Jsb7qTw>
    <xmx:huDkavLSHZKJ27Q6gcqJqyh5lHtV-4Yzso4KEYaUTOX7Mx_RIlvYdA>
    <xmx:huDkaszv5DDPR5JJdj1ZOYE73LJ1_ziyD23P8fLxUDlS2faaUNWHPQ>
    <xmx:huDkakUv8hglOi9msOilFcTpo1z3Ao4DGDJZ1yNhA0AgfeFQUmqpaxQz>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 30 Oct 2026 14:23:02 -0400 (EDT)
From: Paul Barker <paul@pbarker.dev>
Subject: [PATCH 0/4] Selftest fixes
Date: Fri, 30 Oct 2026 18:22:55 +0000
Message-Id: <20261030-selftest-fixes-v1-0-1ba0fc952001@pbarker.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH/g5GoC/yXMywqDMBSE4VcJZ91ALtCCryIuEh3bI2JLTiyFk
 Hc32uXH8E8hQWIIdapQwpeF31uDvSkaX2F7QvPUTM64uzXeaME6Z0jWM/8g2sH76B7WxBCpRZ+
 Ea2hNP/wte1ww5vOFaj0AWMbnGXIAAAA=
X-Change-ID: 20261030-selftest-fixes-2e33b2710bab
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openssh-sha256; t=1793384580; l=1434;
 i=paul@pbarker.dev; s=id_piv_33200296; h=from:subject:message-id;
 bh=Of9+d6oqI9rYbzc0S0oV2ZRDAGNASRb4mVO60c2zxPw=;
 b=U1NIU0lHAAAAAQAAAGgAAAATZWNkc2Etc2hhMi1uaXN0cDI1NgAAAAhuaXN0cDI1NgAAAEEEQ
 dOfZ4fCf9WdA7cHWnYqW4P6zifYTwJ18a3l28hvdGt3M0CTKu/FWpwoh+x5E487TvYA9iW0goTM
 GGtdemFzVgAAAAZwYXRhdHQAAAAAAAAABnNoYTUxMgAAAGQAAAATZWNkc2Etc2hhMi1uaXN0cDI
 1NgAAAEkAAAAgIJFfMTGxGaGiScMNQMDiiUaIWvdla06TN0a++tFFeG4AAAAhALVYPjbhbaGNpc
 JHozrJZ9PNulGlggHQlJmpP3zLN+F6
X-Developer-Key: i=paul@pbarker.dev; a=openssh;
 fpr=SHA256:IlqExt9TPtGqXrqYg/YPMlsWlOGC6AVubz/PwuYw6KY
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 18:23:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249067

These fixes should hopefully address the recent SyntaxWarning errors
seen in [YOCTO #16468]. They also switch us to a supported method of
setting the gpg-agent auto-expand-secmem option.

This does leave us with meta/lib/oe/gpg_sign.py still using the
unsupported method of passing arguments to the gpg-agent. That isn't as
easy to fix as we don't have a temporary gnupg homedir where we can
modify gpg-agent.conf. So, I've opened [YOCTO #16480] to fix that at a
later date.

These have been tested with an oe-selftest-fedora build on the AB [1],
and I've checked that the affected test cases were executed.

[1]: https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/4973

---
Paul Barker (4):
      oeqa: selftest: signing: Fix use of gnupg-native sysroot
      oeqa: selftest: signing: Use supported method to set auto-expand-secmem
      oeqa: selftest: prservice: Don't print regex in failure message
      oeqa: selftest: Use raw strings where required for regexes

 meta/lib/oeqa/selftest/cases/bblock.py       |  4 ++--
 meta/lib/oeqa/selftest/cases/buildhistory.py |  2 +-
 meta/lib/oeqa/selftest/cases/prservice.py    |  2 +-
 meta/lib/oeqa/selftest/cases/signing.py      | 10 ++++++----
 4 files changed, 10 insertions(+), 8 deletions(-)
---
base-commit: b62d5e681741394ad90501a83a1c66b0e3ab7ce3
change-id: 20261030-selftest-fixes-2e33b2710bab

Best regards,
--  
Paul Barker

