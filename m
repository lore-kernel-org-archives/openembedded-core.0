Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web09.7712.1613152810873420530
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Feb 2021 10:00:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=sefwQgcP;
 spf=pass (domain: ossystems.com.br, ip: 209.85.222.173, mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-qk1-f173.google.com with SMTP id 81so417186qkf.4
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Feb 2021 10:00:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:mime-version:references:in-reply-to:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=u66JrGRw6BhKSvCoVSrIu1lCGiQvRsGuJt/GscYQWuM=;
        b=sefwQgcPLzco+aCHJzzPoUMTaFznUnlb/om4Kx5bf6OWmEFs3Lw8dmcU95QPjEiASL
         qPSpiGKx7RbNI9mwzJrPSBU1H43bGmciIsU+toWeMpC0zrHtK90FLtKs2umTln9mdrmG
         VuII+l1MBiFYSLpKPquLIgwjWMkbh1DGQKqBpkiN0ageFPQE5F3yeC9cEXBSh02fAmX5
         3eC23nrwMQqOmQN/rGfUKH56JXiKo9jxD0NAoBWgJsoL9av0J3D/NaSdkgXcAjX/HOvX
         s2wSFhz8wXHBWLFWCgGYnve9YxkcMeFM/CZ7vCV3KFLZPBYPy4LbuF3Ew+QcC3ilewkV
         winQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:mime-version:references:in-reply-to:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=u66JrGRw6BhKSvCoVSrIu1lCGiQvRsGuJt/GscYQWuM=;
        b=BCWRl2x2dG/P2NiIwLAbOrJpcy5hmSfeOEcwc8kwn2y+raZDxW5QbM5n7bOv5zEfNO
         EywECfTIb8VUyl8uK3twMH2NfeaJoAfL2gJTWjLAy8tjWoS/e5d45XsXdbxqZUq71AeH
         KrGWD9yN+aPiNFN8C6DHWbvl+83/YXFnKfpmMk75dL5gD95qmpzore+InFYvIsSPT4Bo
         8AntGlYwyrjS8c7UHQdbbkaWEQHLS01OEsMrLG5R7hWS9ET99zTSIFVnZIokVE8uoBo7
         Apnxj7vh1ElzgN9oMsSplpSmiZiVXqvx/Yx5VC4e5AHjGmk4iPt9YupiFXD22lsI8bH5
         B+GQ==
X-Gm-Message-State: AOAM532Zez4k9U1JygT29WB5Rd4BCfqvlh3MRa15WXzA3CwnXVaV6Pue
	asDCetkDAjbfwdobWd4FfWuq02TVzji6Elrx
X-Google-Smtp-Source: ABdhPJz0XA6hgO927YZTv+sF8SxJ99xZj4osDyYmCw3aMnGnrhSirARic5rWQGNpOckbCmiB128SYw==
X-Received: by 2002:a05:620a:1e3:: with SMTP id x3mr3918848qkn.122.1613152809757;
        Fri, 12 Feb 2021 10:00:09 -0800 (PST)
Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com. [209.85.222.179])
        by smtp.gmail.com with ESMTPSA id 9sm6309260qtr.64.2021.02.12.10.00.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Feb 2021 10:00:09 -0800 (PST)
From: "Otavio Salvador" <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qk1-f179.google.com with SMTP id t62so394293qke.7
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Feb 2021 10:00:09 -0800 (PST)
X-Received: by 2002:a05:620a:10b0:: with SMTP id h16mr3822961qkk.197.1613152809017;
 Fri, 12 Feb 2021 10:00:09 -0800 (PST)
MIME-Version: 1.0
References: <20210212165146.21830-1-JPEWhacker@gmail.com>
In-Reply-To: <20210212165146.21830-1-JPEWhacker@gmail.com>
Date: Fri, 12 Feb 2021 14:59:57 -0300
X-Gmail-Original-Message-ID: <CAP9ODKp=mKt+9gekQmb3gF-tueWfS9tnr9JVJmHvXorqdwU1ow@mail.gmail.com>
Message-ID: <CAP9ODKp=mKt+9gekQmb3gF-tueWfS9tnr9JVJmHvXorqdwU1ow@mail.gmail.com>
Subject: Re: [OE-core][PATCH] weston: remoting backend requires GStreamer base plugins
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em sex., 12 de fev. de 2021 =C3=A0s 13:52, Joshua Watt
<JPEWhacker@gmail.com> escreveu:
> -PACKAGECONFIG[remoting] =3D "-Dremoting=3Dtrue,-Dremoting=3Dfalse,gstrea=
mer1.0"
> +PACKAGECONFIG[remoting] =3D "-Dremoting=3Dtrue,-Dremoting=3Dfalse,gstrea=
mer1.0 gstreamer1.0-plugins-base"

The base is needed as build dependency or runtime?

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
