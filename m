Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com
	[209.85.166.53])
	by mail.openembedded.org (Postfix) with ESMTP id 344217BE8E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Jan 2019 12:40:46 +0000 (UTC)
Received: by mail-io1-f53.google.com with SMTP id f4so3009565ion.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Jan 2019 04:40:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=jy0Sp0fx8Ge8Z1PbhLb55gH5E5z2GKmMbEUGrJ/MyQ8=;
	b=1b+lZ4zqoZ/HkZofSS0JeWMd5ZLpiRhPeLdl9uVRF9x9EBYEoqwgV05I3RsciLHupV
	qM94U6fKs9S1eYlGKJTwnL5DogwR4xZn41rXdGBFxKpP9zg+D3I/wod+dAbLPFpkcdZr
	oWxLzB96GCHuwdCGgtG+Wsv4OSvQMjKel0uFW/KII5PNs7RK76GcVrfQt2buq7736qt6
	RqTNNeebPbGvjQBcXJ/9JzSBRRC1qvr5XLS0ZKsIjgWhPNi8W8qHzBjqFxjqt1AbYDfn
	HrJ0tQI8R1teWc27R9rb9CvN861PqlutlkqCnGh9WBZWEjOgrMcqpCeyoO+kpLxlEKmY
	s2cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=jy0Sp0fx8Ge8Z1PbhLb55gH5E5z2GKmMbEUGrJ/MyQ8=;
	b=rwBfj4wjMe2dJvrls7XaWCiER/xwc9F7MGp8wmg9B7B3e0VoXRx0cSX4jplEhCqPDd
	ZFnYeEzQY3vgwAgjDlGM2b5xGmG/hMLj1ZkHRQZiimUiGNzuk6In6ubCIRq+yZGz7Po7
	YMOsPE75CEhaZqSN7Uy2Bbg+KpShalCeen8MWeR0mMvNNeCb0/OaVmy8srUX01dXiyL2
	qC+LJlGw5+8lH0uc5k4YipMuVsWX0QmkCpMw0nq648hDuN1dvdNtO8ape0pqAvxvI+lL
	0/RkdDRwX7m4HrKqQsU//v4dD0RsF3ULrhegiv8L788Fk792jj9Amyk8OpqW0fDrjoP/
	ew8Q==
X-Gm-Message-State: AJcUukf7Y3H4trrB4n5e9EYgRXZUPb0LeZ7eiG6XKrX4XicpLPsNe9OE
	mLiJp7FkE/mw3qe39+rEi2TevvvGPzZ8fka/ME5pNZi0
X-Google-Smtp-Source: ALg8bN5Gkcq74yY0Rpi8baQ8D4caAq4GYBOTiy8bkiuBG84XmEp1CyQ4PYNgNhj4AIgzjrSevZeR5TgRojgXg0znBLM=
X-Received: by 2002:a6b:acc5:: with SMTP id v188mr868803ioe.20.1546951247125; 
	Tue, 08 Jan 2019 04:40:47 -0800 (PST)
MIME-Version: 1.0
References: <cover.1546938633.git.Qi.Chen@windriver.com>
	<11e2fba7bd1e165047915f5a77cb85ba96410da4.1546938633.git.Qi.Chen@windriver.com>
In-Reply-To: <11e2fba7bd1e165047915f5a77cb85ba96410da4.1546938633.git.Qi.Chen@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 8 Jan 2019 12:40:35 +0000
Message-ID: <CAJTo0La-LVLk8OPabGePojhGMYvA6RRY-8DakEHecVUq_amELA@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
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
X-List-Received-Date: Tue, 08 Jan 2019 12:40:46 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, 8 Jan 2019 at 09:06, Chen Qi <Qi.Chen@windriver.com> wrote:
>         if [ "${hostname}" ]; then
>                 echo ${hostname} > ${D}${sysconfdir}/hostname
> +               echo "127.0.1.1 ${hostname}" >> ${D}${sysconfdir}/hosts
>         fi

Instead of appending to the file, can you put a marker on the
127.0.0.1 line and replace it inline?

Ross

