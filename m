Return-Path: <stephen.arnold42@gmail.com>
Received: from mail-oi0-f52.google.com (mail-oi0-f52.google.com
	[209.85.218.52])
	by mail.openembedded.org (Postfix) with ESMTP id EECBB60853
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Aug 2016 01:12:36 +0000 (UTC)
Received: by mail-oi0-f52.google.com with SMTP id w18so261440725oiw.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Aug 2016 18:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=h6qAb14igrqUMvJxgeBpcyAOTaw35sJYAaG2l4r3bCw=;
	b=gSEJ/AnwldlcDCAwhVbH4VKJnopadD7dDV5/9LC3piUdeGSg9EjUnZYFtamDUdD19U
	m0/EeDVyckBtgCMLYxYTnG8KbutRmnMqtbwQUlobdHs+Z1SS8Xn6P7rQQLQr0AXmnfcw
	itAHhgmXKFOtWACakINplZobxGsFpS+Rmj7m/mCmQeVg+Q14d1ptI2vAm/HFHwguVswW
	Phl9O3lz5nid72kVaNH75cdAG0Yj9HxT2bqGk6hfWjfyxdX7yyWuNrrtYXTw67hbKb4v
	ZZ4vuY1olahakdICnhkO8oZlMru0pX2M7RxCxstO+Cp5FSURytcLk6DJUyyB7Wd9KW38
	EjJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=h6qAb14igrqUMvJxgeBpcyAOTaw35sJYAaG2l4r3bCw=;
	b=LDHvnmZa2Z2479vH1bhdNSsd2ZRjvsnkyLx37uKeG5E/PD5ifHgNUnJgjmJCbIn5lA
	ODsR0vqaqoRpXcX7SylZxnN3HrPzJshwxLhohmTJuncbM2EDT04ntE+IrYYqXN9l2Cs8
	ahtB7FC8znp7XftuLZgQQfPe+ksFZYB6aSD+uQKfkAnjw+lutkpTMd4uBONi7WxOpwhw
	yef1OHJJgZDLXpy3JmrJVOs10TiFtHxkh4CcsI/87yibJ6pU/lb704ZDtlOKUtMnmEVN
	1OmsTWZaGX/kDCozc5u3oa5PpcT2HSOZywHEa/16V47TPBr3C9H0NfZv9hM6TO9CLaap
	ADGw==
X-Gm-Message-State: AEkoouut0gaMGn4OlkYsajhlCMfI53Ss30ufjhF+k9KB4OEiDpK8eSNV5owca0WsBkA2qZHw4YBpE0emEHk1Gg==
X-Received: by 10.157.46.75 with SMTP id c11mr42390116otd.46.1470186756777;
	Tue, 02 Aug 2016 18:12:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.248.164 with HTTP; Tue, 2 Aug 2016 18:12:36 -0700 (PDT)
In-Reply-To: <3cdfa22c-ed0b-1e92-7d82-bc81c2e5ee3d@jp.fujitsu.com>
References: <1470049297-6520-1-git-send-email-fan.xin@jp.fujitsu.com>
	<CAOLEWZVAjfydiq7GwgDKWydZyL_CXDL7+dgn5gsjt+QMhBQzgA@mail.gmail.com>
	<CAJTo0La6G0jmhMVKu1rGjjWrDkACFWNX70hrgY9rnyk2ifXKFg@mail.gmail.com>
	<CAOLEWZWbyZXc53TgQijWtxRbTQ9bEnTULpM9uUa4Hp5Px4AYKw@mail.gmail.com>
	<CAJTo0LbwrLtSG+wv=_379TeQOAAqBHVUet=bD0kfdUUg6_c-yw@mail.gmail.com>
	<8ff3e451-c185-6b95-03e0-9669b838b0dc@jp.fujitsu.com>
	<CAOLEWZX0tzxjWu=xq9+_R87uFWfH9DOMminYBMEu2M-7igcxyg@mail.gmail.com>
	<3cdfa22c-ed0b-1e92-7d82-bc81c2e5ee3d@jp.fujitsu.com>
From: Stephen Arnold <stephen.arnold42@gmail.com>
Date: Tue, 2 Aug 2016 18:12:36 -0700
Message-ID: <CAOLEWZUjdu23AnHkJzjomH7RqddxaF749UH1cr5vLk0LaPRz9w@mail.gmail.com>
To: Fan Xin <fan.xin@jp.fujitsu.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] Replace foomatic-filters with cups-filters
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
X-List-Received-Date: Wed, 03 Aug 2016 01:12:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

sorry, you missed a couple of replies I guess...

It's in the Ross repo now:

https://github.com/rossburton/meta-printing

Steve

On Tue, Aug 2, 2016 at 5:59 PM, Fan Xin <fan.xin@jp.fujitsu.com> wrote:
>
> On 2016=E5=B9=B408=E6=9C=8803=E6=97=A5 02:33, Stephen Arnold wrote:
>>
>> Hey, don't keep all the fun to yourself  :P
>>
>> Let's take a look at the recipes and marge the best bits together; I
>> think I have an update on my end after getting some feedback with a
>> zebra label printer.
>>
>> Fan, can you push/post your recipes somewhere today?  Feel free to
>> fork meta-small-arm-extra and we can take a look at merging.
>>
>> Steve
>>
>
> I have pushed my recipes at here:
>
> https://github.com/fan-xin/meta-printing
>
> I checked meta-small-arm-extra but did not find what could be merged from=
 my
> recipe.
>
> I wonder where the cups-filters and qpdf recipe files should be put. In c=
ups
> folder or separate folder ?
>
> Fan
>
>
>

