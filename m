Return-Path: <sakoman@gmail.com>
Received: from mail-oa0-f42.google.com (mail-oa0-f42.google.com
	[209.85.219.42])
	by mail.openembedded.org (Postfix) with ESMTP id 713436A5DA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2013 13:03:01 +0000 (UTC)
Received: by mail-oa0-f42.google.com with SMTP id n12so624149oag.15
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2013 06:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=MwsWFmhdBJzLrYTcIuBZ8CoPMbB5+CceaGLgOs9o3Xw=;
	b=mfii6SAORzRu6j9ZjwQglVEXfNoCBL2H4Plb0R2WxRWFLoGhFWix8iYGocg9Z85Zut
	rw96APN4XjtGz20bd2qBxxVzzLpYesEWN4QR2LWCMibU/QZAk5ltJboqnPssZfM6jVAl
	906YAWArgdK1DO+UjCxZdCZFau7iHJvlOuFoKqQ02phQ8A7Xpx8GntrsCYzX9K4Q93ef
	sI+hFxNV/BSgPf+aYgwAu2mdmdqixmb+7IzroH5cwIvMhTkOvQ+QiH/N6x+l0VnNrtPl
	Phg+8Bh5OlpkbjUVULP+hcj6cb3IVVYeryoqk0cmg8kjlcJMC875CWrH2xhLci5DASaY
	Ct/Q==
MIME-Version: 1.0
X-Received: by 10.60.145.143 with SMTP id su15mr7761613oeb.65.1370869382499;
	Mon, 10 Jun 2013 06:03:02 -0700 (PDT)
Received: by 10.182.213.130 with HTTP; Mon, 10 Jun 2013 06:03:02 -0700 (PDT)
In-Reply-To: <CAGDS+nmZVx2Jg3+DDhn_-zQytwzBOsKNREFNXF=GgFBn_7pnDg@mail.gmail.com>
References: <CAGDS+nnQjF9P9s61--FW+_1gs_-qbcugmKt7-xd2i6gwkVFpRw@mail.gmail.com>
	<20130610094536.36e83ecd@e6520eb>
	<CAGDS+nmZVx2Jg3+DDhn_-zQytwzBOsKNREFNXF=GgFBn_7pnDg@mail.gmail.com>
Date: Mon, 10 Jun 2013 06:03:02 -0700
Message-ID: <CAGDS+nng63PNh5JiPHkHaJ9BmAERj1_aJgC1VXdnf6RZN60XCA@mail.gmail.com>
From: Steve Sakoman <sakoman@gmail.com>
To: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: qt4e-demo-image with meta-fsl-arm: successful build?
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
X-List-Received-Date: Mon, 10 Jun 2013 13:03:02 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

And of course I should have mentioned in my first email that I am
using the danny branch of both repositories!

Steve

On Mon, Jun 10, 2013 at 5:58 AM, Steve Sakoman <sakoman@gmail.com> wrote:
> On Mon, Jun 10, 2013 at 12:45 AM, Eric B=E9nard <eric@eukrea.com> wrote:
>
>> the strange thing is why do you get a X qtdemo when building
>> qt4e-demo-image ?
>
> I haven't begun debugging yet, but I had 2 initial thoughts as to why
> the X error message:
>
> 1. The qtdemo init seems to be written to support both x and x-free
> setups, so perhaps the init is getting confused
> 2. I had built the x11-free version of qt prior to the qte version, so
> perhaps that causes the issue
>
> I started a clean build just in case #2 is the cause.
>
> Steve
>
>> I've launched a build and will test on my imx28evk asap.
>>
>> Eric

