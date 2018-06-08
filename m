Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot0-f172.google.com (mail-ot0-f172.google.com
	[74.125.82.172])
	by mail.openembedded.org (Postfix) with ESMTP id 9988C7519F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jun 2018 18:45:16 +0000 (UTC)
Received: by mail-ot0-f172.google.com with SMTP id q17-v6so16842269otg.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jun 2018 11:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=6ZWM4g3eNmTLWaRkFRKY82rHalssVrs66104nG7UqPw=;
	b=UAnF4nCvo6OQ4UCnJVCigc+Eh8wjgvYv3UDhokx/e7f1/JAZcq/2yyRhyPF5YOjryr
	/Yypbpiu9eRvouyps4/+edtrq70t19EN3UgT44+xxjBQWgooJ2twd2SGN3oYMK3yXu/A
	oUSY9aTVAfxO+Dnn6R3QNdp5E45vez8txT0q23db7RTWkj0dRBoUL4xwD9GamVPmunmA
	CrO6wrxtMtiCc1ulxeyImjKFdPSuCzMo3P6RyHurEfP5eBsBcs4JbhJ+BRcbIEazLisi
	Xrw0Y8tDtAEjc8eDvH8Q2RBp+ctHucaoDaJYsji5yD/et2wcRG6tALyJmzqHCwUt0t19
	aXxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=6ZWM4g3eNmTLWaRkFRKY82rHalssVrs66104nG7UqPw=;
	b=SfvnyyL767fkrGnfrqt4faiLH+Shj12kvkj2CJ5ui1TuJ13aZuymez7JusqCp+ONJk
	3N+QiawxUxKjZwMhZq7WjEKmSIPCmY+UsftpQrhOEygBkC4M04XN6ceOqeihTCjMq0Zo
	KHCyKVZCJfCSgWZTLxG5vnHudf2MlIS7lvyLOZwjNTgEtsqh4WLkRTmoUpd+rH/N6e3i
	na3AQDnhbziLjbvaGJA7ZA/oGzYPrBKruD16LV821EiopZIdT7VIPZkaY3lWxwNvNiRi
	nbajxvjI+vBM1mBbMTUlFej9lDwGBF2BuAs/4r6wTn/pTOVOuqUM2uRciCHBGVWwOq8L
	oZBg==
X-Gm-Message-State: APt69E04Q+k8QdbtVKNbmsqYdIn3oMA6C5y7LuRlRIi+2FRCagUwFqyL
	H25TTpSi8I91AlqpWdIjI2crN11w4xLRPMW12Go=
X-Google-Smtp-Source: ADUXVKKvTIPcUXTtX3JXoFQ6dssfaf6yXNiDoi77JkHU5C+NbB3E74sXRvR83jB4QtmZMEgI8iOCWNzX4kWhGjEIGtE=
X-Received: by 2002:a9d:4609:: with SMTP id
	y9-v6mr4017985ote.259.1528483517645; 
	Fri, 08 Jun 2018 11:45:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:90cd:0:0:0:0:0 with HTTP;
	Fri, 8 Jun 2018 11:45:16 -0700 (PDT)
In-Reply-To: <toeh8mdywfy.fsf@twin.sascha.silbe.org>
References: <20180608161841.10108-1-x-yo17@se-silbe.de>
	<CANNYZj_V7knzM_+3J+YnHNyG+mbGmkzYBM_GoxTK1jKoYx9UGw@mail.gmail.com>
	<toeh8mdywfy.fsf@twin.sascha.silbe.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 8 Jun 2018 21:45:16 +0300
Message-ID: <CANNYZj9uwH9erkgu8Of5xq6PTLfTqdTdnUJtqMbyqgJa1ONKzA@mail.gmail.com>
To: Sascha Silbe <x-yo17@se-silbe.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gobject-introspection: relocate typelib repository for native builds
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
X-List-Received-Date: Fri, 08 Jun 2018 18:45:16 -0000
Content-Type: text/plain; charset="UTF-8"

2018-06-08 21:17 GMT+03:00 Sascha Silbe <x-yo17@se-silbe.de>:
>     python3 -c 'from gi.repository import GLib'

May I ask, what is the use case for running this in the native
context? Note that we explicitly disable generating introspection data
on the native side (though the g-i class), and so you'll get the
typelibs for the base glib that is bundled with g-i tarball, but not
anything else.

Alex

