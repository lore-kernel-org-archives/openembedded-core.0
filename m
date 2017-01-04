Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f68.google.com (mail-vk0-f68.google.com
	[209.85.213.68])
	by mail.openembedded.org (Postfix) with ESMTP id A1E0371989
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Jan 2017 06:40:03 +0000 (UTC)
Received: by mail-vk0-f68.google.com with SMTP id 19so16006125vko.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Jan 2017 22:40:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=hsxnLnI5GCGvpbKYfiWoG0GmdheEGS/Gpfbv01GcnhE=;
	b=Svf96M2HjCI50LFfZ4njHq2yv7ngyu1+BwsHkiG+YC0pKRHA+t2sjnNKr2ySh3CZhA
	Y26KeBrilIHYwuVHjcbKatcl2NnK8mgr/e3xgVbpV9XNdErQEThEF9wF1jDCnZtc4fxv
	MksKxL5XRZ81AylIYOtgzI6VZ3uh1KvKZ4Vw8ZS9i0xat7oaONsk4I3bGdE4TKmi8uez
	PJkQDB4FecnkgK2WASCtlaxr1sWFuXmLO53RkEe7gz6S2hSz+vHpV4T7j+3ulRR4IQK4
	x8hN9QcDZUMFIdttqM2oK6cRACxnmyDVD1YY823ovhpJcHJ1bTIiMP5gHP7u1p2BpDWx
	rJpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=hsxnLnI5GCGvpbKYfiWoG0GmdheEGS/Gpfbv01GcnhE=;
	b=gPLwIlxQ3g2TQa6MIL7mr9f5LC7YozJq2XbWRA42Z+b93bpN411MD/CdS3O/NA6E2D
	GBaZ82+jKT380YAeDRu4EBGZeinXUOE3gvMVC0GXYkWmR+X85grHQfhRSs70dw1FSU+J
	x1CYivjGXCKWISjiR7oOVR/jXSCMoC4F4wjlFeMxqS1porKSaFgQAdhZ4L2fPMOspCo+
	Sws9WWzaK07QQbuuazByBUBtX0loSkZrqm20aUeJZCmKrShPfVN0coBy8lm3xOcIXR3z
	j/uelpbNVBD2SF/m5zv+0ia4XSVshhVzl5Zf5iAQyHeYeHz0XXb8qkxukcoHAno4BVLa
	yM5w==
X-Gm-Message-State: AIkVDXKW5uJ3SMngRIUbCEUIMiQuGwmrbEdGVze9Bl/kuv8ewwnjrzXGSDe0BIiPq0eEmzyWOvOObwt1zCIFvg==
X-Received: by 10.31.168.7 with SMTP id r7mr22540237vke.148.1483512003656;
	Tue, 03 Jan 2017 22:40:03 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.48.87 with HTTP; Tue, 3 Jan 2017 22:39:33 -0800 (PST)
In-Reply-To: <5e3840aa19de9b634469c852a7c1446262ab73ab.1482363237.git.alejandro.hernandez@linux.intel.com>
References: <cover.1482363237.git.alejandro.hernandez@linux.intel.com>
	<5e3840aa19de9b634469c852a7c1446262ab73ab.1482363237.git.alejandro.hernandez@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 3 Jan 2017 22:39:33 -0800
Message-ID: <CAMKF1soP7afwicknqti_muFYwGrMgNZE+n3rfnVQ8Hg8NeU2aw@mail.gmail.com>
To: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/6] ksize.py: Python 3 fixes
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
X-List-Received-Date: Wed, 04 Jan 2017 06:40:04 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jan 3, 2017 at 2:30 PM, Alejandro Hernandez
<alejandro.hernandez@linux.intel.com> wrote:
> From: Tom Zanussi <tom.zanussi@linux.intel.com>
>
> String errors and partial __cmp__ fix.

may be fold it into previous patch.

>
> Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
> ---
>  scripts/tiny/ksize.py | 17 ++++++++++++-----
>  1 file changed, 12 insertions(+), 5 deletions(-)
>
> diff --git a/scripts/tiny/ksize.py b/scripts/tiny/ksize.py
> index b9d2b19..ea1ca7f 100755
> --- a/scripts/tiny/ksize.py
> +++ b/scripts/tiny/ksize.py
> @@ -41,7 +41,7 @@ def usage():
>  class Sizes:
>      def __init__(self, glob):
>          self.title = glob
> -        p = Popen("size -t " + glob, shell=True, stdout=PIPE, stderr=PIPE)
> +        p = Popen("size -t " + str(glob), shell=True, stdout=PIPE, stderr=PIPE)
>          output = p.communicate()[0].splitlines()
>          if len(output) > 2:
>              sizes = output[-1].split()[0:4]
> @@ -62,18 +62,18 @@ class Report:
>          r = Report(filename, title)
>          path = os.path.dirname(filename)
>
> -        p = Popen("ls " + path + "/*.o | grep -v built-in.o",
> +        p = Popen("ls " + str(path) + "/*.o | grep -v built-in.o",
>                    shell=True, stdout=PIPE, stderr=PIPE)
>          glob = ' '.join(p.communicate()[0].splitlines())
> -        oreport = Report(glob, path + "/*.o")
> -        oreport.sizes.title = path + "/*.o"
> +        oreport = Report(glob, str(path) + "/*.o")
> +        oreport.sizes.title = str(path) + "/*.o"
>          r.parts.append(oreport)
>
>          if subglob:
>              p = Popen("ls " + subglob, shell=True, stdout=PIPE, stderr=PIPE)
>              for f in p.communicate()[0].splitlines():
>                  path = os.path.dirname(f)
> -                r.parts.append(Report.create(f, path, path + "/*/built-in.o"))
> +                r.parts.append(Report.create(f, path, str(path) + "/*/built-in.o"))
>              r.parts.sort(reverse=True)
>
>          for b in r.parts:
> @@ -116,6 +116,13 @@ class Report:
>                 self.deltas["data"], self.deltas["bss"]))
>          print("\n")
>
> +    def __lt__(this, that):
> +        if that is None:
> +            return 1
> +        if not isinstance(that, Report):
> +            raise TypeError
> +        return this.sizes.total < that.sizes.total
> +
>      def __cmp__(this, that):
>          if that is None:
>              return 1
> --
> 2.6.6
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

