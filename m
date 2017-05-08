Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f42.google.com (mail-it0-f42.google.com
	[209.85.214.42])
	by mail.openembedded.org (Postfix) with ESMTP id AD76665CBF
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 May 2017 13:36:19 +0000 (UTC)
Received: by mail-it0-f42.google.com with SMTP id x188so37895058itb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 May 2017 06:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=4vXQ3hbpLcaMZSsVgqCxFgufJyKBAzs+i3l+GLLM6cY=;
	b=SYKYX7e3yjSqHJM2pgTGlZw2o0RUcK4AJQTDg1WUUn81cLwnG0kscf2+G7ogfRf82n
	uiRQsm8N6nkG56wkogvWRGP9Y31NhrxCh0sAnPICLQBeWW75KufAK+pe3kTCOP5n0WxA
	1oVW0VxZCy6qxCIUejKWb6llkD+B8pJ2I7BG5LSpWN5iUlkLYV06y38D7veL1Zh7ZNYy
	NDwbnvQOh6okp1g6PXR2/itASaIVOKXLQ6p4k+JRQWALAJguT5TVH9OWtWigQiyisBF2
	ab3FXJGMudiS8LuE7gEt18Jg1fQQ/RjscZm/ba9K45f20ySVV2/ZrqmF8KrJDlg7eTUz
	diGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=4vXQ3hbpLcaMZSsVgqCxFgufJyKBAzs+i3l+GLLM6cY=;
	b=jq/RfzkwQ5YQF5M0uWjFXUWgRtlnUpMxi8Ln4rOfFkh4Fy+I1T4BR6O0t6gOtAZUGr
	/IxZzQDz9EDqAl5joFWRvvT6ZUsoN72uAP3gKrXZ87ncfQMStDLW2CkatqdiTS997lBc
	bbAiSl/LQAYSSNvPnKWg/vORKHtwR/xUUjaGUcOWv6AbzYT+lDHibEKcEDM6oUSfY5Ec
	5jROq5w1BI8JlhXQeXqBxEukZARGB8Ov9z7qZnkcvPdP3NMDy1nhDUTNOyC/233acwek
	3lcrEoUzdPn6ja1aLUi+93/Os/b+zyL50FR8MD7vvO/12AFkGljPMK1O8L5JUnirTPWX
	kTCQ==
X-Gm-Message-State: AN3rC/78YKjmHi5bkM53mrWbexKV5aTfcjYVUAAwinqEq3Wfja8yljk+
	aXAenqwYoWQpmIxQ
X-Received: by 10.36.32.138 with SMTP id t132mr19603561itt.89.1494250580388;
	Mon, 08 May 2017 06:36:20 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8D834.dip0.t-ipconnect.de. [93.232.216.52])
	by smtp.gmail.com with ESMTPSA id
	w130sm4516267ita.20.2017.05.08.06.36.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 May 2017 06:36:18 -0700 (PDT)
Message-ID: <1494250575.4241.328.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: =?ISO-8859-1?Q?An=EDbal_Lim=F3n?= <anibal.limon@linux.intel.com>
Date: Mon, 08 May 2017 15:36:15 +0200
In-Reply-To: <1487625169-22282-1-git-send-email-anibal.limon@linux.intel.com>
References: <1487625169-22282-1-git-send-email-anibal.limon@linux.intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: yocto@yoctoproject.org, openembedded-core@lists.openembedded.org
Subject: Re: [PATCHv2] yocto-compat-layer.py: Add script to YP Compatible Layer validation
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
X-List-Received-Date: Mon, 08 May 2017 13:36:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2017-02-20 at 15:12 -0600, Aníbal Limón wrote:
> +    try:
> +        ldata = bb.parse.handle(lconf, ldata, include=True)
> +    except BaseException as exc:
> +        raise LayerError(exc)

Anibal, where is this LayerError class in compatlayer/__init__.py
supposed to come from? It doesn't get imported, leading to:

  File
"/fast/work/intel-iot-refkit/openembedded-core/scripts/lib/compatlayer/__init__.py", line 45, in _get_layer_collections
    raise LayerError(exc)
NameError: name 'LayerError' is not defined

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




