Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id 5BB3B77E33
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Aug 2017 13:46:25 +0000 (UTC)
Received: by mail-io0-f172.google.com with SMTP id n71so23204787iod.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Aug 2017 06:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=8JLlbsvvPjaOlpdkW/4ENqTo0Iog+kDcM7niRXcaVLI=;
	b=h2mHXsWFoYRAM6PZ5Ao7jdMDIdBvbmHoAIkecsp0h0cAc6oQHHVTwqv8QzgHwiZiYD
	9ci8yStx4mEt6JAsSKKmYyoOQi1KEsTcK16yEInJlxOTIA76t3Wg6r9PXMAO+zJzQ9Fe
	VeH9726EwdjdOciXQe48zMl1HbiF1QfSpHm2TERFeTOWin1UGCnCDHSSHWEuN2oLr41+
	EBwehYmD3/r4BVIDDH4n/N78afdgwRTXNoFCsPLC0X6YWx3glAYO9JVLq6AuEdNddGAJ
	RvDAM9HVXzLTqmURlAFyaqrGilMHwztM8Ggl679Y7YlJcyXMUKUq6BY3tn7KPocbm/3F
	3FRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=8JLlbsvvPjaOlpdkW/4ENqTo0Iog+kDcM7niRXcaVLI=;
	b=fcObrh3rKQD5iEotdza3Dj4Wwafp9MhH5wfBZwO0OvYcgRE86k/+BQwf07UwuKjK3y
	8j1VN41fflY0oOKWj8k6GgcqSaxDlkjtWVq+aq7nHB/hq45L7fIOAkrrXfRiOgRN2vGZ
	ZQ55Du1LR5c1jYDZkhkhKILpbpzIbTGuzWyDxqlJX8sYnaPZwyE2j6j5U2KmUy+kUKFr
	9STzkl4g+dvrri20oTyQYQyt3Y5o3dmI67C7jP8BVN9KDa0dOKpRhkxteMEoDGQVoPnx
	g+rggyfkjUKB82NRkr2z21mc+FDVjhHSx6QG9c+4Eea4k9KTdVAVofivQP4zcZ27hTku
	DStg==
X-Gm-Message-State: AHPjjUgsIX2UftkvXVq/bcvX0Mqke50RpllefGAtLmPcpPpgpX6++n/P
	WibfmRPa/d4Q6xb75f8r1VWlCy3VcPpq
X-Google-Smtp-Source: ADKCNb5rHAU3RvuBpFmmWMhena4sHiKL8zMR0rlC9qt061edTLvfS4OmWPzUX8j2I8H/i4Av8yOCWjqeoN8QWOiUXoE=
X-Received: by 10.107.27.133 with SMTP id b127mr4921601iob.144.1504187187404; 
	Thu, 31 Aug 2017 06:46:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.33.83 with HTTP; Thu, 31 Aug 2017 06:46:06 -0700 (PDT)
In-Reply-To: <20170831122335.6864-1-clopez@igalia.com>
References: <20170831122335.6864-1-clopez@igalia.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 31 Aug 2017 14:46:06 +0100
Message-ID: <CAJTo0LZTdWS=haawEyk_k2cq=5DKqPM=4s_JS0RyWxyw7epMVA@mail.gmail.com>
To: Carlos Alberto Lopez Perez <clopez@igalia.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] initramfs-live-boot: disable systemd-update-done.service on live images
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
X-List-Received-Date: Thu, 31 Aug 2017 13:46:26 -0000
Content-Type: multipart/alternative; boundary="001a113fd5e2fb3b3a05580cde82"

--001a113fd5e2fb3b3a05580cde82
Content-Type: text/plain; charset="UTF-8"

On 31 August 2017 at 13:23, Carlos Alberto Lopez Perez <clopez@igalia.com>
wrote:

> +    # Don't run systemd-update-done on systemd-based live systems
> +    # because it triggers a slow rebuild of ldconfig caches.
> +    touch ${ROOT_MOUNT}/etc/.updated ${ROOT_MOUNT}/var/.updated
>

Good catch, there's a bug somewhere in bugzilla for a very similar problem.

Presumably/hopefully systemd isn't hardcoding /etc and /var but respecting
sysconfdir and localstatedir, so the touch should also use those variables
(by sedding the script).

Ross

--001a113fd5e2fb3b3a05580cde82
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 31 August 2017 at 13:23, Carlos Alberto Lopez Perez <sp=
an dir=3D"ltr">&lt;<a href=3D"mailto:clopez@igalia.com" target=3D"_blank">c=
lopez@igalia.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div c=
lass=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex">+=C2=A0 =C2=A0 # Don&#3=
9;t run systemd-update-done on systemd-based live systems<br>
+=C2=A0 =C2=A0 # because it triggers a slow rebuild of ldconfig caches.<br>
+=C2=A0 =C2=A0 touch ${ROOT_MOUNT}/etc/.updated ${ROOT_MOUNT}/var/.updated<=
br></blockquote><div><br></div><div>Good catch, there&#39;s a bug somewhere=
 in bugzilla for a very similar problem.</div><div><br></div><div>Presumabl=
y/hopefully systemd isn&#39;t hardcoding /etc and /var but respecting sysco=
nfdir and localstatedir, so the touch should also use those variables (by s=
edding the script).</div><div><br></div><div>Ross</div></div></div></div>

--001a113fd5e2fb3b3a05580cde82--
