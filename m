Return-Path: <jupiter.hce@gmail.com>
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com
	[209.85.166.181])
	by mail.openembedded.org (Postfix) with ESMTP id 9F784611CE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2020 10:12:07 +0000 (UTC)
Received: by mail-il1-f181.google.com with SMTP id s85so20059073ill.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2020 02:12:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to:cc;
	bh=99e0dy03JAPM/JGfCn5wUWDFOt3AZ3iDJCyXN0Ox4xg=;
	b=CENVwTE/otJNXGJoy4X91jHmhLJiBDVBu2MHJy/G1EibJ9ZhTz4Sua8C5ytREWYgfm
	OAnygEhTW33VAYzFodAd+uXmC9YwLJ4pVn1cx84BuDoQH3MmMumnmSdlIKCb0tZj5WiU
	YQ7XvD7oruAZo3LBpXv32WLNiZ4Jx57gY6RkY0svsJmN0XH2vhhazc0GQxcNv/wEiVue
	NiUtat9cFmPo/amSv0rqvuFMxF2JZwXf7sOAvVM3zLFDI0OpYAlSY9htgLt2GtF5Fv4+
	dn1QCFZhg3vIGu0gvrSGk1AkrY5cDggqq6DUfPdKNBlXeM9ipV2CKI4PBj3YicX63roX
	bN8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
	bh=99e0dy03JAPM/JGfCn5wUWDFOt3AZ3iDJCyXN0Ox4xg=;
	b=liGrmExoI5W976t/+xotsG5oh6bqXUQMGZYx4CXRGs5Trrz0tq/8l7NQjqI1E0G+EN
	iZ5dY5inMxC1mgc1bPuaCVhkMuKSj4VYlGmVld2dl6LR4mb0xjr9/KPY7OGBi3ImBtmT
	7kdW59yI1RtngFUI7RXNQpFVX1JXBaL4H5aPZhhb9CAdH27xGI1Kmo4ZYlQjydJhoJV1
	4luBsV8oXvX1SuVE+jZcjIWWQPA2KFNVuHVFum8jxcUhKZ19u/ZNjMS2215j3fW0rPlg
	7A26JkkCsaDhnmnRb09mkVZgPM+Utq2upyFLgA+y8fuO0trMVojoKiRMTk1sh1pioBK7
	bK2g==
X-Gm-Message-State: APjAAAVD10n+oBkGBA3FNEyOiGjDh770kcQ2nSYP2Xc7nmYl7u/usWdr
	REx9JwRFUS/YhjSme3zaqAqmVuSjxPeVA7+Ofum6/Q==
X-Google-Smtp-Source: APXvYqxUlIAE3oxmCk9XUM/AwrcPh5uQh/Vwh7ZReY55sHhERw4AKVFzhlHOCu9G7Gk/SO6V/4lE34mP9eQLBkT3dwI=
X-Received: by 2002:a92:ce85:: with SMTP id r5mr24327013ilo.301.1582107128576; 
	Wed, 19 Feb 2020 02:12:08 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:ad5:5d0d:0:0:0:0:0 with HTTP; Wed, 19 Feb 2020 02:12:08
	-0800 (PST)
From: JH <jupiter.hce@gmail.com>
Date: Wed, 19 Feb 2020 21:12:08 +1100
Message-ID: <CAA=hcWRUzFinBcNXf5EF+2mCwMhA5tz-vEFKubg6_QkwvxOEEg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Yocto discussion list <yocto@yoctoproject.org>
Subject: oe-core recipe for defining directories in /
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
X-List-Received-Date: Wed, 19 Feb 2020 10:12:07 -0000
Content-Type: text/plain; charset="UTF-8"

Hi,

Which recipe defines all directories in "/"? I need to make a bbapand
to add directories to /.

Thank you.

Kind regards,

- jh

