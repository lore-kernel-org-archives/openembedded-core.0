Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
	[209.85.167.47])
	by mail.openembedded.org (Postfix) with ESMTP id C52187CDCE;
	Fri,  1 Mar 2019 19:43:08 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id r123so10481979lff.6;
	Fri, 01 Mar 2019 11:43:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=QiVydUK0lexkvctSXAfDLI4gGQN7Lzt/XaQkJUo57aI=;
	b=OMbEyu8ZPZz60I5VfRBnvzZDKb8nZNzq4Y35M3ZXQdgsf/iK0rvLN3Zh5ifV35srYo
	oMvul7amE/bfxMlZRoK+WcNo9wfPXzjUwGCp4CauRivC40HDhijMf3FaK2a261yaAM0W
	6SVyVXSElpg01QL2bTvBAPxPHJf144PhdpcO2cG5mXBjoJHFoaqizlQnIKxBAlNh3pbn
	l33+InTvJmhVQT5LbLQ+VQHeMm1e9+IURZG8U+Y3nXRy9AJRoGcpUy1r17moICyUcJEQ
	gH6ZHgHTAiWel/X/XpmdAWPDZA73BSm/Zh2bssmp2xbdXtspwvnGLAOt4t8zykJPwntr
	XEcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=QiVydUK0lexkvctSXAfDLI4gGQN7Lzt/XaQkJUo57aI=;
	b=du+yo4PHqOyYjtUIaWc6+oOBuDG3edpA+CA8xDG41ZRRB9Xyes1aTGQy+C2+qXTPel
	JxP7dMBY/05qpQpYH4Nc05ZC/NTY/79jAQzPyyOHOi+srVd39QrR2IU+Dxj1v7hxSc+e
	fo+qLBjWpYq43qLFf7MoktrFq142aAprw39hxCjf2C9yogdugGqnpqlrtqoG3fkJqwnJ
	k5Sq2ip48WQTr5mfNRud7LXKf7if6PAwMe02op2Q578mP3tloQC+b24OIU0Ea82UT+ja
	hLsTyWUgvruq72mQK7G6O7lbQ1sxL5ZMxWz0LeyZg36SBQ2UwCZrj1AcVTZVYMO2UNaG
	bysA==
X-Gm-Message-State: APjAAAU0f87DaYvnhGB6jFq/6QEWtNopqz4oflqzKNhwUPz+D3nQUdTb
	WiQbTjIpJF6oIwZKgpIg1ZpiHxVaQa8ZdV451aA=
X-Google-Smtp-Source: APXvYqz4dxI+ijkNQL4hdHb6H+XjryeEzJgEdUezMGIFlt+5dUjnX0nnW4AJgopIfHROrk+nucwO86dEpdSJIwmhORY=
X-Received: by 2002:ac2:4191:: with SMTP id z17mr3963629lfh.78.1551469389192; 
	Fri, 01 Mar 2019 11:43:09 -0800 (PST)
MIME-Version: 1.0
References: <accf0c0a-77f8-e86c-c0ed-3af8d5a48e3b@balister.org>
	<CAFNP8OtVN5tjv3xV57q+kjiewtH24tdm3HCqHL+dMKayNcKaMg@mail.gmail.com>
In-Reply-To: <CAFNP8OtVN5tjv3xV57q+kjiewtH24tdm3HCqHL+dMKayNcKaMg@mail.gmail.com>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Fri, 1 Mar 2019 20:42:52 +0100
Message-ID: <CAPybu_1WtS2o=E6rpZzJMvpW6RQzPFxy29XGno=ok7bsTpW6XQ@mail.gmail.com>
To: Scott Rifenbark <srifenbark@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	Yocto Project <yocto@yoctoproject.org>
Subject: Re: Information about non-traditional uses of the Yocto Project and OpenEmbedded
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
X-List-Received-Date: Fri, 01 Mar 2019 19:43:09 -0000
Content-Type: text/plain; charset="UTF-8"

Hi

We (qtec.com) use yocto/oe to build industrial vision systems.

Today is running on Potato graders, Carrot Graders, Potato 3d cameras,
Hyperspectral cameras, Beer analysers, Checkweighers, Screw Counters,
Hockey streamers....

Let me know if you think this is interesting and I can share more detailed info.


On Wed, Feb 27, 2019 at 9:16 PM Scott Rifenbark <srifenbark@gmail.com> wrote:
>
> Sounds like good potential for a section or chapter in the user docs.
>
> Scott
>
> On Wed, Feb 27, 2019 at 12:01 PM Philip Balister <philip@balister.org> wrote:
>>
>> During the last OpenEmbedded developer meeting, it became clear that
>> people are using the Yocto project/OpenEmbedded in spaces outside what
>> we think of as traditional embedded. Lieu Ta is working on a
>> presentation for the Linux Foundation Leadership Summit and we would
>> like to collect as many "unusual" applications are possible from
>> companies we can publicly acknowledge. Unusual is edge, containers,
>> desktop, etc. Or even really interesting embedded applications :)
>>
>> Please drop me an email (off list is fine) with enough info for us to
>> add you to a slide and acknowledge your work.
>>
>> Thanks,
>>
>> Philip
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
Ricardo Ribalda

