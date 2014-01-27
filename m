Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f54.google.com (mail-oa0-f54.google.com
	[209.85.219.54])
	by mail.openembedded.org (Postfix) with ESMTP id 0801B6E831
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jan 2014 16:44:19 +0000 (UTC)
Received: by mail-oa0-f54.google.com with SMTP id i4so7087970oah.27
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jan 2014 08:44:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=zuqbn787ve5Ef5ocOO9pLAlf/Oa42HRxyvloiz6OoEw=;
	b=ph/zPa4+gbXYg13RBMkA7XNHOkm8rdY3ROAzjIpQncU3AOhuGTnD4MlXOFqUDpADhT
	FDLZP7JU1vi7kSyhQSCvTyfzXETjfKwE0JyEWzHqgyLZM1sln8/fFV/QlYqovOKCTDFK
	y4P4ybOFshDWBqw/MkkRd8+gkB4+bbFoaSmSgfRlzJs6RtxlfCzcUarD6khtNpteM/u8
	boazH2/euJVD09opTKCuGw8NOAuVRVfL0xHp+XR7feanVmH437RAuRJKXeaUBG3feNqp
	pAO1WJZJwaFPEzv+Ur2dpziGwCypuZ6hriMzzoUmfXdgWNZELN6Sg0pmNbeCO0TOpvaK
	5Rjw==
MIME-Version: 1.0
X-Received: by 10.182.102.134 with SMTP id fo6mr4141964obb.10.1390841060261;
	Mon, 27 Jan 2014 08:44:20 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Mon, 27 Jan 2014 08:44:20 -0800 (PST)
In-Reply-To: <1390833488.17424.252.camel@ted>
References: <1390833488.17424.252.camel@ted>
Date: Mon, 27 Jan 2014 14:44:20 -0200
X-Google-Sender-Auth: SekJyUlkU-M6ftiWTOLl2Fj7Dis
Message-ID: <CAP9ODKpjJsFJgZ_3W10p22q23wqi2BmFawONNtCKGxZoFGB5ow@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] utils: Add a cpu_count wrapper function
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
X-List-Received-Date: Mon, 27 Jan 2014 16:44:21 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Jan 27, 2014 at 12:38 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> Add a cpu_count wrapper function (useful from annonymous python where
> the import would be trickier).
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

