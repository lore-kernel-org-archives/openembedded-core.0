Return-Path: <pascal.huerst@gmail.com>
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
	[209.85.128.54])
	by mail.openembedded.org (Postfix) with ESMTP id 5A7087E718
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jan 2020 12:10:08 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id b19so2219303wmj.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Jan 2020 04:10:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=to:from:autocrypt:cc:subject:message-id:date:user-agent
	:mime-version:content-language:content-transfer-encoding;
	bh=jS0Dy0jSz5Y4tSME3XR3Gfl8AOPumZLGfQQljyCVPyQ=;
	b=BH1pPJue9WEPhQbDurL7uOmSNIdz9dUFjnOBilErRhzk95YfIaY+2jfqX0oKuYY+fg
	nJ5d9XzJv4jivBxJN4tk8wS5rfMVDLq6V9UDFZN3Ys7JPgZs/hIZ0feLWgzw9f8ot9Dk
	TrR1z0p0NSbxWNkQzTx+s3Uk5aHLZ3FgFF1r4uy3i19rJp/e24BQHjkCtXqsR3XE+F3P
	Ny7zHb7mWdJ45J+360arIQ8DrZPAgBI2QBxOXI1HqqVsiQvNgoIaXJOLr5gssNnGN4rM
	iudY4Grebz9R7lytBFYI3lzz2wCaMDVAgKyfo5aVX2RQDjG38qqdPxuLUj8U0iL6HVze
	0oMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:to:from:autocrypt:cc:subject:message-id:date
	:user-agent:mime-version:content-language:content-transfer-encoding;
	bh=jS0Dy0jSz5Y4tSME3XR3Gfl8AOPumZLGfQQljyCVPyQ=;
	b=bemsV1hKXaoD4OeTNgFhA7YKruxkQ9akSGTaJJiBtBvMbA5zMiXeBe46oI/bfv/cKp
	46udmWxDKptT18fwp56xN92CPIzFqEagKHGLqLe6LL3tdwT2HwxjRiBNFRF5fw7fCMHz
	iNuZXkN29SkzC5bohYqboxGLjxwxcEryxpRlosKRL4yE1ohOvJNVFrLizRx7aRIarcES
	vF7y2jdhQ4cw3gZMDvHlQB3uOnqEyBm/FUX3hiOBe6d1ibO77z10bXADX/H/5sOwnB25
	IWJloJRhTLguIpi/xGqAPmaBcQCE1IBRoc2mOtVCHIkyeoK4sZfTuJkk9ESswQzPXov0
	8F1Q==
X-Gm-Message-State: APjAAAXofgJ3TOa0q1+u7hCt0NDbdJ/gFl/sLkh6te731r45afvlbFN3
	okP4bB1yGUWY2FR/u63/jYz4ZW0+
X-Google-Smtp-Source: APXvYqxshBYfseznd/cgZW8dHfc4W5j4iFXdIlbk6B1OxmulgOl5fVPROgdXRBNFRCx14Z78Vj6lEw==
X-Received: by 2002:a7b:c759:: with SMTP id w25mr3690082wmk.15.1578485409229; 
	Wed, 08 Jan 2020 04:10:09 -0800 (PST)
Received: from [10.10.222.52] ([194.162.236.226])
	by smtp.googlemail.com with ESMTPSA id
	p15sm3367155wma.40.2020.01.08.04.10.08
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 08 Jan 2020 04:10:08 -0800 (PST)
To: openembedded-core@lists.openembedded.org
From: Pascal Huerst <pascal.huerst@gmail.com>
Autocrypt: addr=pascal.huerst@gmail.com; prefer-encrypt=mutual; keydata=
	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
Message-ID: <baf60d23-56e5-72a2-f7f7-adb10c29a5f9@gmail.com>
Date: Wed, 8 Jan 2020 13:10:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.3.1
MIME-Version: 1.0
Cc: Rich Persaud <persaur@gmail.com>
Subject: Looking for a way to build latest tagged releases in recipes
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
X-List-Received-Date: Wed, 08 Jan 2020 12:10:09 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hey everyone!

I'm looking for a way in yocto to build tagged releases or actually to
build the newest tagged release from repositories.

There is a way to specify a branch or a tag in a recipe, but no way to
always clone the newest tagged release, that I'm aware of. I submitted a
patch to bitbake's mailing list with a proposal [1], that would use
bitbake's `latest_versionstring()`, to always find, fetch and build the
latest tagged release. Unfortunately there wasn't much of a reaction on
that proposal, so I'm taking a step back, collecting ideas on how this
could be achieved properly.

Please share your ideas...

Thanks!
Pascal

[1]
http://lists.openembedded.org/pipermail/bitbake-devel/2019-December/020618.html

