Return-Path: <sledz@dresearch-fe.de>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 79AD86057A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Nov 2015 14:34:14 +0000 (UTC)
Received: by wmvv187 with SMTP id v187so28581250wmv.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Nov 2015 06:34:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dresearch-fe-de.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-type:content-transfer-encoding;
	bh=g3+v1o3Jx2iaq0DJsO2GjS5s/zxzcEFhaThZNDg812Y=;
	b=xTAgSGEAQGjpwTHbP/QjrfVBWGBbTBk8ggo7f+ikD/wVQtO4KiMFYCImMiuuEaZJFU
	GKrNm1WbJoQ+rVL5OtcfttP8JEweb4+A4KcC1QQWHrWJ8eJve1FWT834s+1hb+D2Gus6
	82bf3JCwQIefFnlrg/63gEpYbnrELW9UmEATCa+FqCiHlRl+BMCwQgs8oxdhB8Pzgdny
	Ij/hIL8rsb3pd7j82vQ13sxs5/lYFat61bQcg6lGkPD1WHDJQXLMp/Odn4rxUZwtdVBF
	WghWmoF1VWDjsApFzh5FFD5m5sA4ZzZITdu+OTOtt/8zIINkqT2qYjzocZ8DRfWjZw2i
	8v/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type
	:content-transfer-encoding;
	bh=g3+v1o3Jx2iaq0DJsO2GjS5s/zxzcEFhaThZNDg812Y=;
	b=YPzstZDFr3tLFEt08ondVs9pokTZ3rCJXQ206oxijEVO4dgVNRmkdTm6K7UQxww9Li
	faanx1nmbHDPxDzkm5pkydE7LCXGKkrUzKb1dLCqcfKmiQkN3mQulPa2b3+4USUClrYc
	tn1fXgfEgq/76Myhh1Rbj1XaOQfcskULeYrXbbRhSlR/rptvvwLW+Ya6JezYj00Kw49y
	1tluTMMInXBPtzuOJYTDRpTsp/F7L59/HA0l40Ow8CUuGyMnwmBLsdRmjT735ljEKHoc
	UItByWV/iKXxfZ1aYgi7D0/eKL08sS1mO5q1raWa00RmFp6s1Slivbfl3g9IyCkYPk6a
	D4+A==
X-Gm-Message-State: ALoCoQllOz27xqng7CMJmial+E37+qR9IUhXt/KrH52gflYaa2Jv5Fujqr7dbC4kFaLAploLAA+n
X-Received: by 10.28.212.18 with SMTP id l18mr17541737wmg.93.1447943655119;
	Thu, 19 Nov 2015 06:34:15 -0800 (PST)
Received: from [172.29.23.46] (zk223.dresearch-fe.de. [217.92.177.116])
	by smtp.googlemail.com with ESMTPSA id
	u205sm8600492wmb.12.2015.11.19.06.34.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 19 Nov 2015 06:34:14 -0800 (PST)
To: Kang Kai <kai.kang@windriver.com>, Martin Jansa <Martin.Jansa@gmail.com>, 
	Chen Qi <Qi.Chen@windriver.com>, Ross Burton <ross.burton@intel.com>,
	Radu Moisan <radu.moisan@intel.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>,
	=?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@googlemail.com>,
	Khem Raj <raj.khem@gmail.com>, Koen Kooi <koen@dominion.thruhere.net>, 
	Jonathan Liu <net147@gmail.com>
References: <5649BDDE.6030107@dresearch-fe.de>
	<564AE081.30004@dresearch-fe.de> <564CA3F8.9020404@dresearch-fe.de>
From: Steffen Sledz <sledz@dresearch-fe.de>
X-Enigmail-Draft-Status: N1110
Message-ID: <564DDDE4.20002@dresearch-fe.de>
Date: Thu, 19 Nov 2015 15:34:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <564CA3F8.9020404@dresearch-fe.de>
Subject: systemd service vs. update-alternatives (was rsyslog: buggy systemd/ua handling?)
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
X-List-Received-Date: Thu, 19 Nov 2015 14:34:15 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 18.11.2015 17:14, Steffen Sledz wrote:
> On 17.11.2015 09:08, Steffen Sledz wrote:
>> On 16.11.2015 12:28, Steffen Sledz wrote:
>>> I'm not sure but i believe there's a bug in the systemd/ua-handling in meta-oe/recipes-extended/rsyslog/rsyslog_7.6.1.bb.
>>> 
>>> In my opinion this code
>>> 
>>> if bb.utils.contains('DISTRO_FEATURES', 'systemd', True, False, d): pn = d.getVar('PN', True) d.appendVar('ALTERNATIVE_%s' % (pn), ' syslog-service') d.setVarFlag('ALTERNATIVE_LINK_NAME', 'syslog-service', '%s/systemd/system/syslog.service' % (d.getVar('sysconfdir', True))) d.setVarFlag('ALTERNATIVE_TARGET', 'syslog-service', '%s/system/rsyslog.service' % (d.getVar('systemd_unitdir', True)))
>>> 
>>> registers the systemd service file under the (ua-)name "syslog-service". So it should not be
>>> 
>>> SYSTEMD_SERVICE_${PN} = "${BPN}.service"
>>> 
>>> but
>>> 
>>> SYSTEMD_SERVICE_${PN} = "syslog.service"
>>> 
>>> Right?
>> 
>> Hi experts! Is my assumption correct? If yes i would prepare patches for master, fido and jethro.

The problem seems to be much more complex then I thought before. :(

The systemd integration for busybox-syslog was introduced by commit cf3618f9a57e46fb78d5be35d473e2dd5290e961.

The do_install stage got among others this line:

  ln -sf /dev/null ${D}${systemd_unitdir}/system/syslog.service

I believe this was made to avoid a package error like this:

  ERROR: Function failed: SYSTEMD_SERVICE_busybox-syslog value syslog.service does not exist

But if another syslog alternative (rsyslog or syslog-ng) will do the same this leads to another error:

  ERROR: The recipe busybox is trying to install files into a shared area when those files already exist. Those files and their manifest location are:
   /home/sledz/work/hipos-dfe.fido/build-closed/tmp-glibc/sysroots/himx0294/lib/systemd/system/syslog.service

So what is th right way to bring a systemd service file and update-alternatives together???

- -- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJWTd3kAAoJEIz5slJ1krPh0f4QAIoQcwiyYs1l1lCCFhg96xry
5wFMCFDdtCCPerpLBPHh0nLcqB5z0JKV9wCfuZu2QBZbh49s/0Qg4F09yN7qT2Bb
auP3yEVIZrekuVIpQYkXOTI5q+1DrC4QCGMFfm7XaJZiqdOBaP9t1xWMQxzA5W3M
OyQCH3JDABkD9UJQbsYLs1Qq6jm1rzbD1ZO5Uv0JvZaW+ZyHvDUHN7M+nlCxWFKE
HPTtri1trgg9iZYZgTG0y2WferO5Unug5TKrFMSLiKv8iwOGha2O45m9nsFWCzZL
vQ+6z1mnL9syVy6kmOakmc2Q+RnSC6Zx2Y3GbPuUMGtn4Y3neole6YaMJ0Yl+Uk7
nn49/f7qxAD6sYJu7YaD0oBbEj/ugKbtFzKcwWjAe365h21Cndt2NkhELr1xUk7/
owwVD60mmPHGCQ6ugT6wSnmLAVO4P5td5HLuDKWIDV2Smtm3XAQ2MQ52vFzr53sh
dyUq3e5J9zuDbYWmC5xRvv77H7R6eUCltkGNHg5JjkbqtUw4NQWteaHTUpM7KlI1
23w0nDU1xACpJDs+TgMzNyo7c+0b0g0SKjw07Qo7aIdNJuHoeik+hJIewMU7KDdl
BjHy1PIFqXdSPR3myMOMOXlDCYJLJSy19roOr067LSiwXSEwycj93AsqMNzaGSWS
8o0HjDbiMarMi2aXCyCH
=4bav
-----END PGP SIGNATURE-----

