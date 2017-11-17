Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi0-f44.google.com (mail-oi0-f44.google.com
	[209.85.218.44])
	by mail.openembedded.org (Postfix) with ESMTP id 1618C78841
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Nov 2017 19:24:14 +0000 (UTC)
Received: by mail-oi0-f44.google.com with SMTP id a81so2354291oii.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Nov 2017 11:24:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=eCY3XW9M/1+YzCPu/KL3HYErSBxjbAWhWx4G0TeCD0c=;
	b=RCd0YAnMTRP1lB8tpfQi+GiauImIBJIvgYGS7pE4Xk/WIUcgas+nNCxwV8UI1XdiU1
	W92pn0LKg+X9M3NrlIWAZHuFo3eNPWRIrbfreKsEMfBHsx4Htliy2/NUojdAAGZ397BF
	nBeNWBDMlMcqjpHueb8FjmeBhOLAK1BgBIG3oFWUBnN/P+n15fc1WjdV1caMSyzC7bUG
	F3HqiKTqFBpttwu0TgFZDQpXX3FNKOpz8ZdYAsJgShNoj4uc2U1ZMtqT5nv636XFW/Dl
	OGiAe6lKUECpgNtGQ6rczuFDsP5tH9/vGBVmJi9Y6PwgOQTWE4Oslu0mBMaV/HfOVKJD
	mJ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=eCY3XW9M/1+YzCPu/KL3HYErSBxjbAWhWx4G0TeCD0c=;
	b=O/KrsLt0zoj6eVUkXErkTytZXN+v4b2zBB8t924u3Bpe+rBiZdm+5IXu5qFOpRFbDM
	Q/TYl2v4xcpR01G3Ukde+cNXe40ggy3DPt3LKI/3TZ+PdML9N3nTshwVzJAL1WHAR9L/
	rwTjx8NOfwyQ4TZcl/7AK7h+TF464Pawolw/qzeU312nUNKLtzFLfaw53EHCKHkd3KpX
	WwA2PK39Z7jbWtcDrCJ2bTs9LGT86cU9lNA+5nHCe1WQsDYINdZu07iePPOBnvd8TwuZ
	9QqbCqW9XIY6soevqI5qvB39O8oinJHl0zWvy1fREmtXKQPygHeA7npv31BAY10FFieb
	fD1g==
X-Gm-Message-State: AJaThX4KxUNOSIgaMQsTBiJ+50xOEnn4+cC0BGLhLFfo5Fl/6ORS/+Kg
	C4LWiuSKMiwc1rXElSN5P5lPU+UV
X-Google-Smtp-Source: AGs4zMbhEQBLMsH/JJ0TbKLin72nnRSsBXj1MUER13sYYp/yB37lfsjEHJt4+L/5D/1Hj1sDylSZEg==
X-Received: by 10.202.232.8 with SMTP id f8mr1981945oih.186.1510946655764;
	Fri, 17 Nov 2017 11:24:15 -0800 (PST)
Received: from mail-ot0-f178.google.com (mail-ot0-f178.google.com.
	[74.125.82.178])
	by smtp.gmail.com with ESMTPSA id x3sm1904984otb.58.2017.11.17.11.24.14
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 17 Nov 2017 11:24:14 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ot0-f178.google.com with SMTP id 18so2895493oty.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Nov 2017 11:24:14 -0800 (PST)
X-Received: by 10.157.34.200 with SMTP id y66mr2000549ota.276.1510946654286;
	Fri, 17 Nov 2017 11:24:14 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.17.210 with HTTP; Fri, 17 Nov 2017 11:24:13 -0800 (PST)
In-Reply-To: <20171117175142.2642-3-stefan@agner.ch>
References: <20171117175142.2642-1-stefan@agner.ch>
	<20171117175142.2642-3-stefan@agner.ch>
Date: Fri, 17 Nov 2017 17:24:13 -0200
X-Gmail-Original-Message-ID: <CAP9ODKr0hRs9GJXGOU60auppOaM=O25TqLoW1H9vrg+vBMKuFg@mail.gmail.com>
Message-ID: <CAP9ODKr0hRs9GJXGOU60auppOaM=O25TqLoW1H9vrg+vBMKuFg@mail.gmail.com>
To: Stefan Agner <stefan@agner.ch>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Stefan Agner <stefan.agner@toradex.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [rocko][PATCH 3/4] openssl: Upgrade 1.1.0f -> 1.1.0g
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
X-List-Received-Date: Fri, 17 Nov 2017 19:24:15 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 17, 2017 at 3:51 PM, Stefan Agner <stefan@agner.ch> wrote:
> From: Stefan Agner <stefan.agner@toradex.com>
>
> Deals with two CVEs:
> * bn_sqrx8x_internal carry bug on x86_64 (CVE-2017-3736)
> * Malformed X.509 IPAddressFamily could cause OOB read (CVE-2017-3735)
>
> Signed-off-by: Stefan Agner <stefan.agner@toradex.com>


Acked-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

