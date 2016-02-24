Return-Path: <twoerner@gmail.com>
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id B9BA5771D9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Feb 2016 16:06:59 +0000 (UTC)
Received: by mail-io0-f182.google.com with SMTP id l127so48370451iof.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Feb 2016 08:07:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-type:content-transfer-encoding;
	bh=079W8Fv8jiLk3t2R5Csl6W1WkZIZbX+rc6XS7VTxS9s=;
	b=bSTEJNo/wkONeepSpSVCXeO+966aT/GoGx9g5XYVvo1Ktx7lPBc5uF5mchMRoQ3Rq1
	iQ9L8aXRBCk1oi3V+I4wNpN/VHeb5r+qV7qw5tuAy8f2sKFqwQfXlBPZoLxd8DPBbW7O
	73kwZy0eh3Vr3/L0TLbK4U8YoEn1xtbLlLrGyaEY9k/WEPEMjV/Z/3xNlVAvBLjiNDzq
	w+fL3pDKNQfnS89+9RLctEsoMSfQylSCHGypc2NrVQB0/hpTIjq1c88dWNcjNhjjhmLf
	/zIMN+7GoS5wMNR3ASL6bMoa4/hKfj6wv+C9LLBg3/oH3qiFPy3dzl0y1scBAj19O/nO
	18Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type
	:content-transfer-encoding;
	bh=079W8Fv8jiLk3t2R5Csl6W1WkZIZbX+rc6XS7VTxS9s=;
	b=B69reyxzyKaCkt2DmEyddFym1nVH88vvrw3Jr877KZDReZZBQN8Cn2cvv+bI8P+k5/
	kyqMFWSqsMJCmuIbBCXiDrCL5BoSJTaGhemIoKGaLvbzAVATZKkSwCrilPdtfBzWpl17
	53wSep5cllj0jAUD+uWE3tfdnSgkYDbhhHGg+GsNE3gZjmfPaKGM5OejrP/TO0969Bfo
	moJTcyoI05PwdrZP+HrIMjkQIS6p9FqdoiZGs/7dMzDSAQFVDAIw89VsamODaY+0lshJ
	ogJ1pofgISzLRys9OOMyDNahXBRanjfFpTuG6rjLYjFe4bcjAQj629NNvi40Jt3ZP0vE
	hPng==
X-Gm-Message-State: AG10YOR4w8C0VgSh8MTdnqPC8k3sLJlAcEFuv5VR+3fJOW7krk2HUuZle1Aw7CEXPvFdBQ==
X-Received: by 10.107.9.193 with SMTP id 62mr14274763ioj.27.1456330009828;
	Wed, 24 Feb 2016 08:06:49 -0800 (PST)
Received: from [192.168.141.85] (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	ee9sm1509417igb.7.2016.02.24.08.06.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 24 Feb 2016 08:06:49 -0800 (PST)
To: Joshua Lock <joshua.g.lock@intel.com>,
	openembedded-core@lists.openembedded.org
References: <cover.1456325292.git.joshua.g.lock@intel.com>
From: Trevor Woerner <twoerner@gmail.com>
Message-ID: <56CDD519.9050109@gmail.com>
Date: Wed, 24 Feb 2016 11:06:49 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <cover.1456325292.git.joshua.g.lock@intel.com>
Subject: Re: [PATCH 00/10] Integrate swupd software updater
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
X-List-Received-Date: Wed, 24 Feb 2016 16:07:01 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Ideally the work done here and the work done on meta-swupdate[1] would 
be somehow merged so people creating images/distros would only have to 
learn and integrate one software update solution, instead of having to 
evaluate and choose between the two (or more?).


[1] https://github.com/sbabic/meta-swupdate

