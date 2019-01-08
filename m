Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f177.google.com (mail-it1-f177.google.com
	[209.85.166.177])
	by mail.openembedded.org (Postfix) with ESMTP id D4EBA7BF2E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Jan 2019 12:45:55 +0000 (UTC)
Received: by mail-it1-f177.google.com with SMTP id m8so9921955itk.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Jan 2019 04:45:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=3Jm8+QFYYrVRqTtU4/EMFGE23VEbwwyrl92sjqQ/Km4=;
	b=RT1fRDsyjkM2oJNDIF7Oh2LvpR0AUJwFBPTFO9fm2etSlGcN+F4FRRPqfHHq7enakF
	1L0lG2ebF1e6xexOD4Yb+3EtUyLBq2z7j8yUN+38WPzF6Xvw+4jfYbO+TFLIMcqK3lGM
	nhDSIPuR1hLM6FCwTkKWhU8YSSBFTB5+e/jdcg5PX2Oh9M7mnpXab68iO/6plCGvhh+N
	u21T5+qUoZXLM9T5CzLOZRM1URwqGUWMLNUkeoI0FfG0JqTbPuRjdK/g3+LJzYCbvH0H
	RCI+E3lX8VSQswmcrVvx8RuXUsLA6ffDKcyAUVg8uAthsZh6gpZ0BYbnWQU/Ukhs5ThK
	CG4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=3Jm8+QFYYrVRqTtU4/EMFGE23VEbwwyrl92sjqQ/Km4=;
	b=fM8JmvX5jlRl5BVO4xDTyhiVOQ5Pkx3vrA/KQS8+SFSyePN5oEo/nTaAlavFHI/oCo
	aSQ2o57eraMAukhQRep6MdiHLL4vQUn5bRRNEfdbmonzk0SZWfqdDJBEfkjy89fuOGPv
	Xm+zui7bMTW7fcTItAdahG9rgeYf+kKFJBlVHiciNrLKjowx6spWmGUIAyLjCPiXmMDo
	EGhuOBufs6WA84v3L887/qrSz8wvt6wcFkmGHBg8OMmqruwH5jbO9M9MUwlDPAT9S8X1
	r3bzQowd7rTJmu0QASvZODxhARNEJT/8JdOXq4a9k/h1oMMU84dNyEaO8y5OBCKqFD90
	Ilng==
X-Gm-Message-State: AJcUukf4wXjqM9ncbOiw6o3H4GtpGOf9IT0qhg0tU0BupWZAmx6QsyQQ
	0wiaIuQOFv3aHjm/jKwVkh3qaFUU+6i/C7I5WHkSVg==
X-Google-Smtp-Source: ALg8bN5iEs/lKINbt0gF7Uv39llrtOh8s+OAJvbA6X2dQZAaP46bya6Bm0pK4Dtfy1lzD+9oMWrU1kQmwYtbateWJ4U=
X-Received: by 2002:a24:8e43:: with SMTP id h64mr1089355ite.26.1546951556901; 
	Tue, 08 Jan 2019 04:45:56 -0800 (PST)
MIME-Version: 1.0
References: <cover.1546938633.git.Qi.Chen@windriver.com>
	<11e2fba7bd1e165047915f5a77cb85ba96410da4.1546938633.git.Qi.Chen@windriver.com>
	<CAJTo0La-LVLk8OPabGePojhGMYvA6RRY-8DakEHecVUq_amELA@mail.gmail.com>
	<7e7292a7d955db6ae138a10af3c5894dedbd6c29.camel@linuxfoundation.org>
In-Reply-To: <7e7292a7d955db6ae138a10af3c5894dedbd6c29.camel@linuxfoundation.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 8 Jan 2019 12:45:46 +0000
Message-ID: <CAJTo0Lbj10QLG-AH6YYOua1NtZfcPGKi0swnKR444bPjBrJZEQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] netbase/base-files: move /etc/hosts from netbase to base-files
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
X-List-Received-Date: Tue, 08 Jan 2019 12:45:56 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, 8 Jan 2019 at 12:45, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Tue, 2019-01-08 at 12:40 +0000, Burton, Ross wrote:
> > On Tue, 8 Jan 2019 at 09:06, Chen Qi <Qi.Chen@windriver.com> wrote:
> > >         if [ "${hostname}" ]; then
> > >                 echo ${hostname} > ${D}${sysconfdir}/hostname
> > > +               echo "127.0.1.1 ${hostname}" >>
> > > ${D}${sysconfdir}/hosts
> > >         fi
> >
> > Instead of appending to the file, can you put a marker on the
> > 127.0.0.1 line and replace it inline?
>
> Not so good if hostname isn't set?

hostname = "${MACHINE}"

Hostname is always set. :)

Ross

