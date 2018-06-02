Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
	[209.85.218.66])
	by mail.openembedded.org (Postfix) with ESMTP id 64C53748D2
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Jun 2018 21:40:18 +0000 (UTC)
Received: by mail-oi0-f66.google.com with SMTP id 14-v6so17343116oie.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 02 Jun 2018 14:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=xQYIcitZfwB0jN6UVfXaD8H9dzhF5uvVoQ6QmnSlAPE=;
	b=neU0LtnSXSIFMycC2b4OOrPK3dYr0unux8WejY+91ASiObmtEfCyWz0bMUKYQ0q1U0
	LtzYPabvRFXx96thv6nlcUN82NyR/1WgFaqSpU3LYkriCuQWrByRceQsCr110s9DyIBT
	S62KGHKMNGZWj8TCTOhKvqirDzyrGLh0Sc2vhP61yHMpbOqt0TH9Zkf8p79ieuSwxmRZ
	zNXArlvZW7IzJJazoiTS02eKVjW+ZM81CH3FUBUDSVmULTAZOWgbMIkeqKGjRwsjeIyV
	Q4mUxGzPNOP8kJX5YIydq6tewTnmFvzdQBi+BLx344r7mbu3eiUottRaTKZ86hdlh1zG
	YDpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=xQYIcitZfwB0jN6UVfXaD8H9dzhF5uvVoQ6QmnSlAPE=;
	b=UruuYOlUSMuN6lYWys8LMzV9a6B3OsThlFg5N+mgTz+KujXbY6q2IZXw1yYGV3FGRw
	omgA0z9wB+qeFYWLAPByF5aw0FGd7UO2Y2RNt7g5SO3cMDrWSQJHRuIZs5R+8as8sOZy
	4VOezf3AXLKLDKyTNbsNiCwJRQLV/Tu7aE8k6rMxIu7BOF9hvhyLc3YcdhfeC6RqZn19
	GnBujJGeTh1fQ4hGawAS/FFFRzyJuUV1HYSceHci+cwiUpZZdvkcEexlj8fM5shANSS0
	FOvzLTe0RBnifFtd6Hc6F9mOvIRGSWNj4hY/yRgxufktYFAA7xvOspx6yxFwBzE7nJ+F
	F8VA==
X-Gm-Message-State: APt69E0tq4+G7cT5xc24vw7LTdfA28UuT96ptDhUHgCQRaTaWkPALCyK
	afLw5viP7/dJG2fNxqzonNmbhhOXZp+Jbbcs1E4=
X-Google-Smtp-Source: ADUXVKKAVnkHEVYK7xV2XnhjuaQ60pEBtCYG6XhQWUcD0/ceqW3E7ES58XXF2UAzNxk7yOeXyQVdsktxDZCNHYKjegk=
X-Received: by 2002:aca:fd55:: with SMTP id
	b82-v6mr8319464oii.321.1527975619419; 
	Sat, 02 Jun 2018 14:40:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:90cd:0:0:0:0:0 with HTTP;
	Sat, 2 Jun 2018 14:40:19 -0700 (PDT)
In-Reply-To: <d9184760-664e-9d92-b607-53511e8bb1c1@sashko.rv.ua>
References: <20180601221440.29992-1-dev@sashko.rv.ua>
	<CANNYZj8VhXbaD93SpM130mx4v4b1Hjfr7fe8F30g+MR-+FaQxw@mail.gmail.com>
	<d9184760-664e-9d92-b607-53511e8bb1c1@sashko.rv.ua>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 3 Jun 2018 00:40:19 +0300
Message-ID: <CANNYZj8Hke_Y3D7ip5d0ZZ+J4EvUr8GkTUnF+gah3OuyXudkgQ@mail.gmail.com>
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 1/2] chrpath: fix SRC_URI
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
X-List-Received-Date: Sat, 02 Jun 2018 21:40:18 -0000
Content-Type: text/plain; charset="UTF-8"

2018-06-02 16:45 GMT+03:00 Oleksandr Kravchuk
<open.source@oleksandr-kravchuk.com>:
>> It's better to stick with debian, the tarball is still available
>> through ${DEBIAN_MIRROR}:
>> http://http.debian.net/debian/pool/main/c/chrpath/chrpath_0.16.orig.tar.gz
>>
>> Can you also investigate the other instances of alioth, namely shadow
>> and minicom please?
>>
>> Alex
>
>
> This is a subjective statement. Having mirrors is great, but having a
> working SRC_URI in the recipe and mirrors five times great: I have seen both
> original source and the mirror being inaccessible for a period of time
> multiple times.

${DEBIAN_MIRROR} is not a mirror for alioth, it's a mirror for debian
packages repository and their original tarballs. The place where
apt-get looks for .deb packages in Debian. So it's unlikely to go
offline.

As chrpath is a debian project, we should prefer taking it from Debian
rather than other sources. That way it is more likely that it will be
kept up to date.

Alex

