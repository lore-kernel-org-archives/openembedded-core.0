Received: from mail-vs1-f68.google.com (mail-vs1-f68.google.com [209.85.217.68])
 by mx.groups.io with SMTP id smtpd.web11.5178.1602526433686129696
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Oct 2020 11:13:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TRV3iib4;
 spf=pass (domain: gmail.com, ip: 209.85.217.68, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f68.google.com with SMTP id x185so9649187vsb.1
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2020 11:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=d7rnZI5N6ZswEoIhRhu0bu7YkMo6oGnYZIvFnhYNVXI=;
        b=TRV3iib49vQaOt2k0Ra19lw0C2nZrGMXa49q7WBGMlaU+zuZKPUx2h15evyEFWa9fE
         /gs2uLVuPmxBUSz3IaTQIhpOda/Ples1yurZwTtprHnKuquady7l0htgXjlYXJDkDhBr
         FpGONnTP4k+zjynTCstpOjfD+ux+Y142+0X0616fJ5+iscyQ6JM9/yjdPTDmvxIuFPf2
         jgOl/VS6JC3PqMjReV+cjXkUPZtKHSbZixbZTpq/cn9L0V6G46J6aJ2oqwKAZ68rOD02
         LAfTqssBUxwNyWBNSY8Hs0BvRFITb2BxCSWJuxJbv1jz7EWAsoGr7uzx426h6hTaQtNi
         rwhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=d7rnZI5N6ZswEoIhRhu0bu7YkMo6oGnYZIvFnhYNVXI=;
        b=f7xv6nRSBg1NFwSdM+KbqrVs4n+qfo5uoo8JgfMp/qNBgz7yi4wnskBm2rWFNbwDk5
         Hxq7zu9FKm+TzFJog8vuoa1lclDERHFEfpkJ+3MnGhCcVes6c1XnHTCC2sHgNqFJ3eo5
         mJbPTVzOpLM8Ig9pweG5mNBs37TYYo4t8UpU6dmhJ/YhDP1EzlWpaQKoMCQfj1Dr5f02
         vNQ3rUCPeL0hHhnxTDCNQ6y1w84NUECGN06uK/wQ7XY9sGg9pEDnGWjAKk/gSkR+nGAI
         L7/VLWW9/RI2bdlh2BsquERypZwfO5sJRcyaNvjIYAa64HNv2t8KBDFAg5hEVmBBq/J8
         +d/A==
X-Gm-Message-State: AOAM530ja+9XdQBV544fSPjPTe4R2y6Yi5ZET6kvGFkdYgCPVHl9CLt+
	Hu2DI2uTc0W3CQYzJR9MYPK7+cxA9mgEg16PQr0=
X-Google-Smtp-Source: ABdhPJwVdYNx7inIaJISJFI0S2MPlqiB9d3pR7lu2QqqGrljjCyryVsc1AxxQ6DfPxKQDpZYmlkM9X5J1UKZZsN1eg4=
X-Received: by 2002:a67:1087:: with SMTP id 129mr8347338vsq.41.1602526432765;
 Mon, 12 Oct 2020 11:13:52 -0700 (PDT)
MIME-Version: 1.0
References: <20201012123620.2095778-1-quaresma.jose@gmail.com>
 <20201012123620.2095778-5-quaresma.jose@gmail.com> <CANNYZj-gsTcYJjpwxeT7TwAj8QQptQUBSd6N5QmaoNR82JQRUA@mail.gmail.com>
 <CANPvuRmb_GnG0R2+6zRHxWJG0Hu4cAYD_6kKEyZRp+05+9E8Mw@mail.gmail.com>
 <CANNYZj-w+S4Zk0Vjav6KABUNwX3a=jCjDznHDHBch6sLOXpJnA@mail.gmail.com> <CAHtQpK5hq5dZVwwwxUq3hvgQ3zUfAibx5Qboh6Ju7VvxWA+n2Q@mail.gmail.com>
In-Reply-To: <CAHtQpK5hq5dZVwwwxUq3hvgQ3zUfAibx5Qboh6Ju7VvxWA+n2Q@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Mon, 12 Oct 2020 20:13:41 +0200
Message-ID: <CANNYZj9Mr1VLAY5=ubgdYO08KWWUTPfd50CMqT-jcvZ44rPtMw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 05/13] gstreamer1.0-plugins-bad: disable vulkan
To: Andrey Zhizhikin <andrey.z@gmail.com>
Cc: Jose Quaresma <quaresma.jose@gmail.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000c4ad0905b17d4242"

--000000000000c4ad0905b17d4242
Content-Type: text/plain; charset="UTF-8"

On Mon, 12 Oct 2020 at 20:05, Andrey Zhizhikin <andrey.z@gmail.com> wrote:

> That has been addressed in meta-freescale-distro layer
> (
> https://github.com/Freescale/meta-freescale-distro/commit/01c87325571e5ee91ecc575c863fb693fc1c9955
> ).
> There has been a similar native dependency required for GPU SDK build
> with Vulkan support, hence the recipe for glslang has been introduced.
>
> Should this be maybe ported to OE-Core?
>

I think the provided links indicate that gstreamer currently does not
actually support this, and requires a different tool by google? And
gstreamer upstream seems to have conflicting opinions on which one they
want to require.

Alex

--000000000000c4ad0905b17d4242
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Mon, 12 Oct 2020 at 20:05, Andrey Zhiz=
hikin &lt;<a href=3D"mailto:andrey.z@gmail.com">andrey.z@gmail.com</a>&gt; =
wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">That has been addressed in meta-freescale-distro layer<br=
>
(<a href=3D"https://github.com/Freescale/meta-freescale-distro/commit/01c87=
325571e5ee91ecc575c863fb693fc1c9955" rel=3D"noreferrer" target=3D"_blank">h=
ttps://github.com/Freescale/meta-freescale-distro/commit/01c87325571e5ee91e=
cc575c863fb693fc1c9955</a>).<br>
There has been a similar native dependency required for GPU SDK build<br>
with Vulkan support, hence the recipe for glslang has been introduced.<br>
<br>
Should this be maybe ported to OE-Core?<br></blockquote><div><br></div><div=
>I think the provided links indicate that gstreamer currently does not actu=
ally support this, and requires a different tool by google? And gstreamer u=
pstream seems to have conflicting opinions on which one they want to requir=
e.<br></div><div><br></div><div>Alex<br></div><div><br></div><div> <br></di=
v></div></div>

--000000000000c4ad0905b17d4242--
