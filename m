Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi0-f53.google.com (mail-oi0-f53.google.com
	[209.85.218.53])
	by mail.openembedded.org (Postfix) with ESMTP id 6DA2374621
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Sep 2018 14:31:53 +0000 (UTC)
Received: by mail-oi0-f53.google.com with SMTP id 8-v6so14046786oip.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Sep 2018 07:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=xZJncSnbAKqvL0nBTRR7oH2rfBL9CJlxKcMTk5wJOf8=;
	b=CqbtZpW/lpZ/qUCzQq9Om0EidRtSvQxWm8XrOXp8oWR36Dtk/oyXUva3r6ZhDelA4M
	Jut99fX4bhb+qfHx6A7k7s3bNe+XBVjO3tFGlzh7E0p4AA6UFa5V8A3bqODeAvIHt3DQ
	XeS1hoCqRtPXldFjlmy7DOR6tyrcgFpAVRbic72klEodWPjl7y1eH46JnIbPpNI2vNuy
	GVqMzmbgpIX2ioHDeoKBAEGEZpAeBbCaX0tyIdCLW7YgmbKPF/yqAo4ry2cnYcijCRf6
	yTOUi3TZ7g5Np3ZCpiniQdkWDo0yYFn6nIvv6SgHGhw2tCKd5B0/vVCsEv6QeawdPUUF
	QiAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=xZJncSnbAKqvL0nBTRR7oH2rfBL9CJlxKcMTk5wJOf8=;
	b=EuDV71pcUoECHgGDAAcKkgnb8L8SVHysPLW5GpqBPDIA/rVeZKVZADF3RUgfo4fQL8
	yzBdOKcQwbRanFqNxGH8jnpjNLPSeZ2iomcKpyRWRiU54zPIGp3dmRrLHorrV5TKO03U
	y9xOXgYt6qrwKg5M/0oUPyrpz3V0EykccBBW2DXu5GvzSUl/M7gjtj1ZTZOlj1WdKBiH
	TWWfRqJHcw3z1QqqDPjjoAcxJ7PcfLZU081ORiKjljrVtTKTDkWpaLjDu8I7Kzql/OPj
	7xjxDL4z8XeljLq012KAC93ZdcFDd76gMwyMEx7rIbamNvritmaHXW4QW2BncqJ5VCwH
	Tv2g==
X-Gm-Message-State: APzg51BEaIjppC+BGopCxr2RfXI/4ES1DlX8imac9oQtR0qlQ2umLGmK
	o8Ayky+GO9FuRn2DJHtbOS4oPzpVj2/hRsWMGC4=
X-Google-Smtp-Source: ANB0VdZuYsqUeBxkGjWaTtwUUh9KFohHV9GMbyc5olPiGDsJPf/ExgyUQREGfyy0+xkkUzlQ+oSz5a4x38we7765IXs=
X-Received: by 2002:aca:3ad4:: with SMTP id
	h203-v6mr28803002oia.294.1536157914499; 
	Wed, 05 Sep 2018 07:31:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:5c9b:0:0:0:0:0 with HTTP;
	Wed, 5 Sep 2018 07:31:53 -0700 (PDT)
In-Reply-To: <CAMvyGd_XsQCHnfPiJNuLpD-ATzHnPgHcOARkRzTB-3Z0B5pXyw@mail.gmail.com>
References: <CAMvyGd-9c41OHDgy1qaxhiNyQwH9Hf9Nzo3bqfw+fanGF-AdNg@mail.gmail.com>
	<CANNYZj9_WHwO4iM1dkhQDKkBXfeNyNdA7cAioh7=D-5DEgLb2A@mail.gmail.com>
	<CAMvyGd_XsQCHnfPiJNuLpD-ATzHnPgHcOARkRzTB-3Z0B5pXyw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 5 Sep 2018 16:31:53 +0200
Message-ID: <CANNYZj9wCiYfHO3vWjO-2dwF8E0vKd7rJHh7zTdkodU0HApsmw@mail.gmail.com>
To: Tarun Tej K <tarun4690@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: bitbake gstreamer1.0 : "Nothing PROVIDES 'gobject-introspection'"
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
X-List-Received-Date: Wed, 05 Sep 2018 14:31:54 -0000
Content-Type: text/plain; charset="UTF-8"

'Nothing PROVIDES 'gobject-introspection' means you do not have the
gobject-introspection recipe, which is added as a dependency by the
g-i class. I do not recommend you try to backport it though: just
remove the class inherit from gstreamer recipes.

Alex

2018-09-05 16:25 GMT+02:00 Tarun Tej K <tarun4690@gmail.com>:
> Thanks for the response.
>
> The issue I have is, although I have added the gobject-introspection.bbclass
> within the classes directory, I get an error saying 'Nothing PROVIDES
> 'gobject-introspection'.
>
> The other class I use (upstream-version-is-even.bbclass) is also present in
> the same directory but it gets inherited by gstreamer1.0_1.14.2.bb without
> any error. Why is there a problem for gobject-introspection only?
>
> I totally agree to your point about updating to latest YP release. It is
> just that our project is depending on some recipes related to older version
> BSP so it will be a while before we completely migrate to latest release.
>
> Thanks
> Tarun
>
> On Wed, Sep 5, 2018 at 7:44 PM Alexander Kanavin <alex.kanavin@gmail.com>
> wrote:
>>
>> What is the issue though? You need to be clear about it: paste the
>> exact, specific error message you are getting.
>>
>> Generally, I would recommend that you update to the latest YP release
>> first. Backporting recipes in this fashion is a complicated task.
>>
>>
>>
>> Alex
>>
>> 2018-09-05 15:36 GMT+02:00 Tarun Tej K <tarun4690@gmail.com>:
>> > Hi,
>> >
>> > I am trying to build the latest gstreamer version 1.14.2 using the yocto
>> > recipes from
>> >
>> > https://github.com/openembedded/openembedded-core/tree/master/meta/recipes-multimedia/gstreamer
>> >
>> > I have added new version recipes to my custom yocto layer; added the
>> > required .bbclass files to 'classes' directory inside my custom layer.
>> > There
>> > are older version (1.4.5, 1.6.0) recipes in other layers but my layer
>> > has
>> > higher priority so the 'bitbake -s' shows 1.14.2 as the version of
>> > gstreamer
>> > family, so that proves the recipes are successfully parsed.
>> >
>> > After that I am trying to build gstreamer1.0 using the command 'bitbake
>> > gstreamer1.0' but I get an error saying
>> > Nothing PROVIDES 'gobject-introspection' ..........
>> > Close matches:
>> > gobject-introspection-stub
>> > gobject-introspection-native
>> >
>> > I have verified that the gobject-introspection.bbclass file has been
>> > added
>> > to classed directory of my layer. I have removed gobject-introspection
>> > from
>> > the inherit list in the  gstreamer1.0_1.14.2.bb and it successfully
>> > continued to bitbake until some 'installed but not shipped' error
>> > occurred
>> > at do_package_qa task. Also another class
>> > 'upstream-version-is-even.bbclass'
>> > is also inherited by gstreamer1.0_1.14.2.bb and that is also present in
>> > same
>> > directory as gobject-introspection.bbclass but I don't get any error
>> > with
>> > that.
>> >
>> > I am using the yocto setup cloned from freescale's repository
>> >
>> > (http://git.freescale.com/git/cgit.cgi/imx/fsl-arm-yocto-bsp.git/tree/imx-4.1.15-1.1.2.xml?h=imx-4.1.15-1.0.0_ga),
>> > so this might contain older dependency libraries. Also the bitbake
>> > version
>> > is 1.28.0
>> >
>> > What could be the problem? Please let me know if I need to provide any
>> > additional information to understand issue better.
>> >
>> > Thanks
>> > Tarun
>> >
>> > --
>> > _______________________________________________
>> > Openembedded-core mailing list
>> > Openembedded-core@lists.openembedded.org
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>> >

