Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web09.1237.1617059247808666562
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Mar 2021 16:07:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IMXZwb78;
 spf=pass (domain: gmail.com, ip: 209.85.222.175, mailfrom: devendra.tewari@gmail.com)
Received: by mail-qk1-f175.google.com with SMTP id c4so14174732qkg.3
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Mar 2021 16:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=OgQ/fSwzXLGOoHe53P6nLTQdIukGuX/K1G/UMJphyFY=;
        b=IMXZwb78M5jnjsb2hiSCE/w6momZrCnkb9Tr1DnDg+T3MzB1KDoDbS0Vkjj71X5UkM
         pqd8NhmPG4nC8my+vvEjhzcGWggiociaJdYL9+5DEU3fpVjjxTHIwMkxnLV3yF5YzfeW
         X8lx3tSX+FGZX91E5kxEPxWV1V7KnuO5wBMElw4O2ELV0U5UsElyLLQdMmq1LFicm2J8
         wrqykfyZNyAqpIo7i8jSh3XffPLWUB4RyqfDGfXxQKmkzchgRSK1nR6H7owtYgpQUqwx
         LzAJJFaSx2U2uU9XrXobuaAN5AWgkdczRsFm/+wlTgYCpLxfQhz3YPujpCGgmx3C/3IX
         fFbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=OgQ/fSwzXLGOoHe53P6nLTQdIukGuX/K1G/UMJphyFY=;
        b=CKeOQfNsvzJXbnL6KDyrET5RgwIA5k+QveUg8dJUF3No/vXJqFFca6hiXdEzE7YqnJ
         PWHbDAXoQ2fEa7YKdvM/Qy4obXL2vSlK4knjg3Cx8m/3o2g3HCzsT773sMTE8yBYngSs
         nO2bDtlLYCt76iEvOBkVAwsnFMGva/0xtIU9e4Xhngk8MwqD85EPuM/Hzst5cRfGBVUt
         AYNy3ZDlB510syg7HloBT5b1BEp44H7vS4y+1WP2EynwNgP/6Swi+x4AgVZGj4I9h8oT
         LZsah/9Yg52laO4DqhMUBU+ounAei6L/Krz/PDHcVW3HOKO6wjDdzJHu/1UYOp68ZjWd
         OvFw==
X-Gm-Message-State: AOAM533etyl3ESo20jRsESWfezhYJbWC74b8hm2Tg1JFPUpxBDTjXCWb
	YTKpw7JbiO7Bakd8eHhm6eU=
X-Google-Smtp-Source: ABdhPJyx4kyE7sQc450NlTF1GFlPsW0XTpgvBPuknBEMhUOrveQByHw+u1mIf2w7JVKLNK2VReOchw==
X-Received: by 2002:a05:620a:15d4:: with SMTP id o20mr27500980qkm.81.1617059247003;
        Mon, 29 Mar 2021 16:07:27 -0700 (PDT)
Return-Path: <devendra.tewari@gmail.com>
Received: from [192.168.0.2] ([177.183.205.78])
        by smtp.gmail.com with ESMTPSA id 84sm14620631qkg.8.2021.03.29.16.07.25
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Mar 2021 16:07:26 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: [OE-core] [PATCH] Use shutil.move when os.rename fails
From: "Devendra Tewari" <devendra.tewari@gmail.com>
In-Reply-To: <CAJ86T=Xn9tLHWrqqr1ZV9rAwZD7sG6x0QsyVRkUSKLwiGQKL8g@mail.gmail.com>
Date: Mon, 29 Mar 2021 20:07:22 -0300
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
 OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-Id: <D5D63158-3A18-4F86-9262-9280A587D4C2@gmail.com>
References: <20210329151442.86306-1-devendra.tewari@gmail.com>
 <9e81b71466b771c55d8859e7d156b662e1c3d4f7.camel@linuxfoundation.org>
 <CBEFAFBB-3A73-41E2-A177-BBE047E615D1@gmail.com>
 <CAJ86T=Xn9tLHWrqqr1ZV9rAwZD7sG6x0QsyVRkUSKLwiGQKL8g@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

I did try that but got an error that does not happen when we try =
os.rename first. I'll try to reproduce it again.

I suspect there may be subtle differences in os.rename vs shutil.move =
with respect to what happens when origin and/or destination do not exist =
or are invalid.

> On 29 Mar 2021, at 20:00, Andre McCurdy <armccurdy@gmail.com> wrote:
>=20
> On Mon, Mar 29, 2021 at 3:45 PM Devendra Tewari
> <devendra.tewari@gmail.com> wrote:
>>=20
>> Thanks! My bad. The example I looked up in Python docs had a break =
and I just realized it was a looping example.
>>=20
>> Here=E2=80=99s the updated patch (or should I submit it again via git =
send-email?)
>=20
> It would be better to use shutil.move unconditionally in all cases,
> rather than have a separate shutil.move code path which only gets
> tested by people doing incremental builds in docker.

