Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C13DC77B7E
	for <webhook@archiver.kernel.org>; Tue,  2 May 2023 15:24:38 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web11.1085.1683041074724131570
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 May 2023 08:24:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=c4pC+tf7;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: festevam@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-24e3d17ba74so42177a91.0
        for <openembedded-core@lists.openembedded.org>; Tue, 02 May 2023 08:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683041074; x=1685633074;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S0aq6C/AMgn/1L6GobsV5JqerNnTXvLcZAZLhUfSzAs=;
        b=c4pC+tf7ydLDETcjbeouFslI39WKBslt4i3VQ1U7CLHjTiQhgsvIJeiuM+6eWXBcvP
         pjgKSSTBP4TnknKLhLJMB00szUPh2Wb67fOWQXpWIa0L3flLDRdIivpBkmuE+REhdMbs
         VbZQbthKDxV6iEBrEnr7Kx3wzZh5iqO02EFjGudjLpbND2I+hWVwp4l68NDuZyVJ52xo
         r4gCdAbAcbI7vAKq3oblVLzhXgIqZPUsr6HcbOHPOy6LDIPuEiFc6yqH8qymnPTe6R+w
         I9z9Uu0cZaHg2a40eXCYIh0lBhU0bOdBQ8tcQR1bHFh5B1ey4BEs+j17xT5Q8cMb+Z5t
         eS6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683041074; x=1685633074;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S0aq6C/AMgn/1L6GobsV5JqerNnTXvLcZAZLhUfSzAs=;
        b=kLUn3gAo3yiv8HEkoRSts4se00cGiGVlYjWg9gjXp/T/K/aMD77XVLbFbZ+TMZ0sBT
         QgB4Eyu0lM9q0/mvEsFXnPTTxPf1L35GQSNJZnlVB0tMfZLgaOcqTXaYYVrLtfOyGngc
         wfy1BjjK+tbgZ0lLK4tnmun7OmBe1nZ8wOf9miy/795VkMIVOJj+/fuNYx3Fn0wjluxp
         jO8hqsEXSDYYICscpGQcK34vyFSd+EFT5Q6gFU6nDfFyUyjQlvgDWl4U6tGSNrgBt1OH
         oZ8OdkE81yTsx3QqeQmwHUJQmqCxqf4LmyR05FNCn8aYekShIne7wqKCHDZQcpbcFGJq
         HGmQ==
X-Gm-Message-State: AC+VfDxowUzSjgUSFysKokMOWyBsqa9v6849QGT7j5FEoXXlijL5c5TU
	iPxRW5SoWZR4tWGTtzB1lKAeAx8n+Yd0DFQPz5M=
X-Google-Smtp-Source: ACHHUZ6PtfaRqtS47iTrMNa0Hv3nIJDiDe2dliSEAIz1vtLKBaEch8hBqP+tzNNsUODNOQK2VCIQ/qVo1fuxnZ/zqBc=
X-Received: by 2002:a17:90a:45:b0:247:9c7d:523a with SMTP id
 5-20020a17090a004500b002479c7d523amr13407501pjb.4.1683041073946; Tue, 02 May
 2023 08:24:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230502152008.113566-1-f_l_k@t-online.de>
In-Reply-To: <20230502152008.113566-1-f_l_k@t-online.de>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 2 May 2023 12:24:22 -0300
Message-ID: <CAOMZO5D9ac2J2mm_Oh4ooDdNzzVhaZvNT2jY=Y-nEY_9FQ+2Kg@mail.gmail.com>
Subject: Re: [oe-core][PATCH 1/2] gtk4: update 4.10.0 -> 4.10.3
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 May 2023 15:24:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180746

On Tue, May 2, 2023 at 12:20=E2=80=AFPM Markus Volk <f_l_k@t-online.de> wro=
te:
>
> Overview of Changes in 4.10.3, 22-04-2023
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> * Fix a popover positioning regression in 4.10.2
>
> * Fix issues with slow loading files in the file chooser
>
> Overview of Changes in 4.10.2, 21-04-2023
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> * Fixed issues:
>  - Holding control to select multiple files broken in filechooser (#5669)
>  - Inspector crash (#5681)
>  - Listbase doesn't account for bottom padding in size_allocate_child (#5=
380)
>  - Leaking AT contexts (#5690)
>  - OpenGL / Windows: Crash when closing gtk4-widget-factory (#5685)
>  - GTK apps crash on startup when setting cursor-size to 0 on Wayland (#5=
700)
>  - Segmentation fault: gdk_wayland_toplevel_set_startup_id() needs to nul=
l-check
>    display->xdg_activation before using it (#5701)
>  - Possible use-after-free under gtk_scrolled_window_update_use_indicator=
s() (#5684)
>  - Wrong error message in `gtk_init` (#5704)
>  - Segfault when scrolling after changing ListView model (#5763)
>  - Bluetooth panel from the Settings app: clicking in the "Downloads" lin=
k
>    no longer opens Nautilus (#5671)
>  - Broadway docs or code is broken (#5662)
>  - Disabled GtkPicture's are not properly themed (#5683)
>  - Setting CSS padding to a GtkTextView gives the context menu an offset =
(#5695)
>  - A11y: the Showing state is used only for windows (#5194)
>  - Gtk4 expander: CSS nodes mismatch code vs. documentation (#5723)
>  - Invoking gtk inspector on a folder results in a crash (#5729)
>  - Double tap requires very precise touch input (#5580)
>  - Name autocompletion dropdown in the GTK4 FileChooser's Save dialog get=
s
>    stuck, creates artifacts, jumps around (#5743)
>  - Links are not opened when xdg-desktop-portal OpenURI is not available =
(#5733)
>  - GtkSnapshot generates no nodes appending whitespace-only layouts (#574=
7)
>
> * Translation updates
>  British English
>  Bulgarian
>  Chinese (China)
>  French
>  Indonesian
>  Korean
>  Russian
>  Serbian
>  Slovenian
>  Turkish
>
> Overview of Changes in 4.10.1, 14-03-2023
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> * GtkFileChooser
>  - Improve search performance
>  - Be safe against pathless files
>  - Fix memory leaks
>  - Only show local files in recent files
>  - Show most recent files first
>  - Make files non-selectable in selet_folder mode
>
> * GtkListView / GtkColumnView / GtkGridView
>  - Fix scrolling problems
>  - Support CSS border-spacing
>
> * GtkComboBox
>  - Fix a size allocation problem
>
> * gtk
>  - Size allocation fixes
>
> * Accessibility
>  - Miscellaneous property fixes and improvements
>
> * Wayland
>  - Fix an ordering problem in surface disposal
>
> * Windows
>  - Fix Visual Studio build with older GLib
>
> * Translation updates
>  Basque
>  Bulgarian
>  Catalan
>  Czech
>  Danish
>  Finnish
>  Friulian
>  Galician
>  Georgian
>  Hungarian
>  Lithuanian
>  Polish
>  Portuguese
>  Swedish
>  Turkish
>  Ukrainian

Missing Signed-off-by tag.

