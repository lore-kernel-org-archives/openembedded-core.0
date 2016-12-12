Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id 65FD560770
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Dec 2016 08:01:22 +0000 (UTC)
Received: by mail-io0-f182.google.com with SMTP id h30so158270357iod.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Dec 2016 00:01:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=kbZcAmTc5txRnIhf82dwOKGVGGYkZGQBq9Gm7nr7Clw=;
	b=wVkRgYqH1YDPosAM17wIBROXwDpMA3ujrHHy35j3DDydO1cFXOnABtj6gXKKE/enVb
	ouVLUmEX91yIkRKOrUPqeDG3za7m4JlYrumk5Qtg2jOFt6ffQztgYhk+G6pFNVzBW0Hk
	YgQkMTvoKeCa6Na28qBF5ISbDwboKDdeZDjssF186K6rKxKJQz8A7s+MS5//vPcUAoYX
	6pRpw+GLFyZw9L1Jhn1YRNcEd6pqdY+TCFD0xlOVZqjEpPv6n7BWPvGcoJqlP/qBuYIJ
	EvFpkCZhdWsymC7illiltGgQRYZ1g/C3RNkkv5TCFiRg4uTJ/z+mk64O6Nvz38DKy4tA
	ISfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=kbZcAmTc5txRnIhf82dwOKGVGGYkZGQBq9Gm7nr7Clw=;
	b=kEimDjMwMR9U/BYtqiIeTghgfW+VH1l7jKWVRunZu9ThOYvR5k1sWvCQ7IB7Ee6G3w
	5uMTQeizgLx5q7h2azQogzQhjnS988HgpIoI+DIxJFHZUa+cqpvaymHzHzPGplw3CZoN
	6Lak1XWqaCFTnxfaGVZp4qSZEQbcW+FuvmRImFm/ITCehbtVArSZF0apWG1ejONmoJvT
	LrAA5MMmjqdv+rgucQoq/rXQr6Ff5aUnoeuFbN7Q89Ad2AvQCLo5z65Xs+xPQENBVWu3
	AKb8nPcMPm3Deh8nn1XEynN6xow73djX+6CrHgfsDlGc5ZFUl/jr+6qwgCyS8TJ0hr+m
	kqOg==
X-Gm-Message-State: AKaTC01I0GctEX8TFFVB11DVaFp1ScE1Ytp+A6kvAlaq0KNPpOhzLXMCMy4Pgjy5aTxgFt1B
X-Received: by 10.36.193.197 with SMTP id e188mr15429587itg.99.1481529683804; 
	Mon, 12 Dec 2016 00:01:23 -0800 (PST)
Received: from pohly-mobl1 (p5DE8E6D1.dip0.t-ipconnect.de. [93.232.230.209])
	by smtp.gmail.com with ESMTPSA id
	23sm19102690iok.24.2016.12.12.00.01.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 12 Dec 2016 00:01:22 -0800 (PST)
Message-ID: <1481529680.17535.194.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Chen Qi <Qi.Chen@windriver.com>
Date: Mon, 12 Dec 2016 09:01:20 +0100
In-Reply-To: <ab38ee33f9231e77d0ce97eb56809c4e3eac4855.1479809328.git.Qi.Chen@windriver.com>
References: <cover.1479809328.git.Qi.Chen@windriver.com>
	<ab38ee33f9231e77d0ce97eb56809c4e3eac4855.1479809328.git.Qi.Chen@windriver.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/4] base-files: respect VOLATILE_LOG_DIR
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
X-List-Received-Date: Mon, 12 Dec 2016 08:01:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2016-11-22 at 18:10 +0800, Chen Qi wrote:
> -           ${localstatedir}/volatile/log \
> +           ${localstatedir}/${@['',
> 'volatile/'][d.getVar('VOLATILE_LOG_DIR', True) == 'yes']}log \

I find the "if/else" expression easier to read, there's no need for an
explicit d.getVar(), and there's an utility method for variables which
are meant to be booleans:
   ${@ 'volatile/' if oe.types.boolean('${VOLATILE_LOG_DIR'}) else '' }

Using the utility function ensures that typos are caught and allows
several other values besides yes/no.

The change itself of course works either way. Just my 2 cents ;-}

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




