Return-Path: <steffen@linuxbe.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id D310273183
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jan 2016 14:46:59 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id f206so126995126wmf.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Jan 2016 06:47:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxbe-com.20150623.gappssmtp.com; s=20150623;
	h=from:subject:to:cc:message-id:date:user-agent:mime-version
	:content-type:content-transfer-encoding;
	bh=XhOj1MpsQQ5tW9xGlB+SHTyp0wdacNsCD//E83uXVaE=;
	b=sbMQXAAtUEjtvzJ7CK/TcRUgfv/1wNw7gAl1CC1O2WRE9hnL0YG/tqLFOVFF5F77w+
	0yvV62KU/VKCJ6yfYlgExZ2fHGoZWhXoE/fEDDHYxpUc+4zNe/q16ekpaDegJR/qHp4c
	I67b6kzZXGy/6jZE+InsuFiwwzy5RDVfnDC2AJiEOaB+D5i5ESuWoWSZzFbsyVleuH5b
	P09WS9otyRkmd/33VAsNMD1Hjq01Nu1HWcZo7BVWtHMzVLne8MYPytnLhOR7LSn8DNQf
	DcM6jmid8AJsk5sjsng1RwqfMWH3V9f2kLvR9CBdeVy9W95/9Q1I3lLG143tVz4ftUv2
	1MlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:subject:to:cc:message-id:date:user-agent
	:mime-version:content-type:content-transfer-encoding;
	bh=XhOj1MpsQQ5tW9xGlB+SHTyp0wdacNsCD//E83uXVaE=;
	b=hfOOPiYyjyitKqcliIjzOolBcJuutBo/0cw+KwriEadULfpL2pIqomnDlMoEKUQr2n
	sl5J5rPAq7l2XbIjkCZby33lr5cY2ukpVM9CytPAC96CW346q++xtpbAynaUYMRjapiC
	k2BvjOrUyKYWidCaKH//hInOqvUtZ8TGaFlIjpDJVkgL59G+E1Qymj7y1MftF3mcADfX
	1iZ3koDY4NMwyI4CsogZXfYwUxNlEpMS56Hgf22TThWqy7Vi2WmBXhRzGTFDzWtuZyVF
	bRSIHR3y7MPQIEsRVxwYGHi/44Fc88bke8Bj706sLDbH7ipQOCrzwkTLGQEC1R8WUWvi
	6aMw==
X-Gm-Message-State: ALoCoQlq3RLJDvJ5MxsliPMZiDhkJ8YQOXHhLMIrgDhb2Ja3NC/uYwmuRLFHr04BQinA7g6DtJIM3PirLDPcZjDkGJZ2sJEOAw==
X-Received: by 10.28.176.131 with SMTP id z125mr16851419wme.5.1452178020094;
	Thu, 07 Jan 2016 06:47:00 -0800 (PST)
Received: from [10.47.50.105] ([81.83.24.121])
	by smtp.googlemail.com with ESMTPSA id
	q6sm101445024wjx.28.2016.01.07.06.46.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 07 Jan 2016 06:46:59 -0800 (PST)
From: Steffen Jaeckel <steffen@linuxbe.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <568E7A62.8000006@linuxbe.com>
Date: Thu, 7 Jan 2016 15:46:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:43.0) Gecko/20100101
	Thunderbird/43.0
MIME-Version: 1.0
Subject: [jethro/fido] logrotate: backport binary location patch
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
X-List-Received-Date: Thu, 07 Jan 2016 14:47:00 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi,

I would like to propose the backport of the following logrotate patch to
jethro/master and fido:

> commit bca5a7a2b63411ee1d51cd2112ad9503d5107381
> Author: Hongxu Jia <hongxu.jia@windriver.com>
> Date:   Mon Nov 2 16:33:27 2015 +0800
> 
>     logrotate: do not move binary logrotate to /usr/bin

I tested for jethro on i.MX6 successfully.

Thanks in advance,
Steffen
-- 
Steffen Jaeckel
Embedded Software Developer, Linux Belgium
http://www.linuxbe.com
GnuPG fingerprint: C438 6A23 7ED4 3A47 5541 B942 7B2C D0DD 4BCF F59B
My OTR public key has changed on 20. Sept. 2015
jabber: jaeckel@jabber.ccc.de F052DE29 4FA9A02D 44A794E5 AE5AC0FB C5865C64

