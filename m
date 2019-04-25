Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id DCDF660745
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Apr 2019 09:51:40 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id c5so20518222wrs.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Apr 2019 02:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=saXLQoFBLUDcoB8UiI4eFCXYQ1mah4bUPOLa0pzmgFA=;
	b=DHpPdaOi5rT8aDMaO/7gMnPS0DeblYNrPYy10K+QDKE1UOzqB5K520UfKfUZi8xnlZ
	Jh5sABmFTfDu3k/Qulc80IkCSnjLZJjgegsSDENTSHkeQ3B6MO5M1z+XiuxBxCgPBiTU
	FBh0lUBt77eQ8KLIqG1769bPBN09P0tK8TZZI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=saXLQoFBLUDcoB8UiI4eFCXYQ1mah4bUPOLa0pzmgFA=;
	b=PqQLy2FQhrRDXuHz9DAjgbq0dOLw2MSIZm41JQOdMyu++PdIn+TVk55vVuck8QOZF0
	8VCwlzfMXwE9DnZ9MGU64KJGdld3kRUWlZ9T2P9yAgnNNWXdH9We6yKxLvy8pedn+1V6
	O5QHnL4ZhhuJpOjn1AMSzh2rYT67657erGkumVO8XbIhqqPca0V5lutvCv0IOMDmN5Ji
	uZ24XxqG31bZhFxc4ont6wOAAzIfP0UiwN3ctgCR3ipwViEC5+7GjOwGmpO3deIEtHV6
	gVTaO8/cYMlon1zguDtVhA8PZCT9MoD1pxrvx91LAEjriYq4SAiYYL7shTsHwfn4kXUt
	gzvA==
X-Gm-Message-State: APjAAAWyJ3TzVmXrCENN8OI0vYOm3NBXgDAi2A8vAQjhRBTgvFVRyO9M
	5s4wcBm+uBB5A18okv/ogF1OwQ==
X-Google-Smtp-Source: APXvYqx5/Xv9Yf1eji3LRN5Idc3ux2QCbP5siQRETA+avQVj+JjzwO2fuCdvHhZaml+cxQDeCzAaIA==
X-Received: by 2002:a5d:4805:: with SMTP id l5mr3867850wrq.279.1556185901429; 
	Thu, 25 Apr 2019 02:51:41 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id e3sm5397214wro.35.2019.04.25.02.51.40
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 25 Apr 2019 02:51:40 -0700 (PDT)
Message-ID: <e773b3b210d8055f56c7ba09fe2b07ed704eaeaf.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Naveen Saini <naveen.kumar.saini@intel.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 25 Apr 2019 10:51:39 +0100
In-Reply-To: <1556157276-87248-1-git-send-email-naveen.kumar.saini@intel.com>
References: <1556157276-87248-1-git-send-email-naveen.kumar.saini@intel.com>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH v3 2/2] bitbake: fetch2/git: git-lfs check
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
X-List-Received-Date: Thu, 25 Apr 2019 09:51:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-04-25 at 09:54 +0800, Naveen Saini wrote:
> Build will fail if repository has lfs contents in absense of git-lfs tool on host.
> Build will pass if repository may or may not contains lfs content if host has git-lfs installed.

Bitbake patches need to go to the bitbake list.

> Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
> ---
>  bitbake/lib/bb/fetch2/git.py | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/bitbake/lib/bb/fetch2/git.py b/bitbake/lib/bb/fetch2/git.py
> index 8185bf4..d862942 100644
> --- a/bitbake/lib/bb/fetch2/git.py
> +++ b/bitbake/lib/bb/fetch2/git.py
> @@ -503,6 +503,15 @@ class Git(FetchMethod):
>  
>          repourl = self._get_repo_url(ud)
>          runfetchcmd("%s remote set-url origin %s" % (ud.basecmd, repourl), d, workdir=destdir)
> +
> +        if self._contains_lfs(ud, d, destdir):
> +            origbbenv = d.getVar("BB_ORIGENV", False)
> +            path = origbbenv.getVar("PATH")
> +            gitlfstool = bb.utils.which(path, "git-lfs", executable=True)
> +            if not gitlfstool:
> +                raise bb.fetch2.FetchError("Repository %s has lfs content, install git-lfs plugin on host to download" % (repourl))

Can we just rely on the usual PATH here please, I don't think we need
to touch BB_ORIGENV? We can assume the environment will be setup with
git-lfs if its present.

> +
>          if not ud.nocheckout:
>              if subdir != "":
>                  runfetchcmd("%s read-tree %s%s" % (ud.basecmd, ud.revisions[ud.names[0]], readpathspec), d,
> @@ -553,6 +562,21 @@ class Git(FetchMethod):
>              raise bb.fetch2.FetchError("The command '%s' gave output with more then 1 line unexpectedly, output: '%s'" % (cmd, output))
>          return output.split()[0] != "0"
>  
> +    def _contains_lfs(self, ud, d, wd):
> +        """
> +        Check git lfs repository

If we're going to add a comment, please make it useful, e.g.

Check if the repository has 'lfs' (large file) content

> +        """
> +        cmd = "%s grep lfs HEAD:.gitattributes | wc -l" % (
> +                ud.basecmd)
> +        try:
> +            output = runfetchcmd(cmd, d, quiet=True, workdir=wd)
> +        except bb.fetch2.FetchError:
> +            return False
> +        if int(output) > 0:
> +            return True
> +        else:
> +            return False

Can be slightly simplified to:

        try:
            output = runfetchcmd(cmd, d, quiet=True, workdir=wd)
            if int(output) > 0:
               return True
        except
bb.fetch2.FetchError:
            pass
        return False

I did wonder if we could/should also catch an exception if the output
can't be turned into an int for some reason with:

        except bb.fetch2.FetchError, ValueError:

Cheers,

Richard


