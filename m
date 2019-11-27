Return-Path: <andre.draszik@gmail.com>
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
	[209.85.221.49])
	by mail.openembedded.org (Postfix) with ESMTP id B04AC7F9AE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2019 12:56:43 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id s5so26547513wrw.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2019 04:56:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:user-agent
	:mime-version:content-transfer-encoding;
	bh=x+/PRG6tecrQ/x7QJmJNqcst2aJ3CSBWqNXVjcN5PQg=;
	b=AfkJBJxlf+3ygbbD/sAyRSBLGzzDkTLXj/dYP1wrmP8qsAUOL1XqOO0NpDmfusByOD
	Dxgh6NFeMpZ/U+vyZhRE4Jgp97dpvryAEBoIJx05ee0P2HYfwcQiK6bbAmUWd8sSaW4A
	SQzihtH5WzEyYE2HOVVDblrA8vn33/a1709is/dj6WK0nqjf0oI3Ox6M9SpS/xgQymFz
	i0oEHy/84b98JKyco+U/GeoUGLTu88iNA0+USX36WEVRILMNvG4qdtdW4XSf60Q7K6jp
	mLN7DzNSZw8tefZqLtKXxvNEiQfEmIkoOp2YzejBlTA27h5QXW1+a3K5o1zXZitgNNqT
	j2CA==
X-Gm-Message-State: APjAAAU0z+fmI+uWavdeQImPTtYlzHDfx9WJUFT1PVf7l4irg58UpL2/
	83ODcMZloA30NmKHqNZXbkNexNod
X-Google-Smtp-Source: APXvYqyy122MIh+7q9necBOtR1XlqGMzZv/pCipyX700X5GnSHjrN9lCbud6LwZS1fX4V1RrKoorGQ==
X-Received: by 2002:a5d:4991:: with SMTP id r17mr42662331wrq.176.1574859404217;
	Wed, 27 Nov 2019 04:56:44 -0800 (PST)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	v20sm6854540wmj.32.2019.11.27.04.56.43
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 27 Nov 2019 04:56:43 -0800 (PST)
Message-ID: <0a51e56f3585d35895cf858f8e044a3dc5234948.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Nov 2019 12:56:43 +0000
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Subject: packageA rdepends on packageB but it isn't a build dependency warnings
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
X-List-Received-Date: Wed, 27 Nov 2019 12:56:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi,

I am getting above QA warnings for some packages. Simple example - a recipe
packageA with a shell script that calls out to certain other command line
utilities from packageB.

Given packageA is only a shell script, it ought to be enough to simply add
an RDEPENDS on packageB in that recipe. But when I do that, most of the time
(not always it appears, though!) I get the warning from the subject of this
email.
I have even seen the generated IPK package to not have an entry for the runtime
dependency. Again, sometimes, not always.

Is it really necessary in this case to add a DEPENDS, or is there some flag
that can be set or something? I didn't find anything after a quick search...


Cheers,
Andre'



