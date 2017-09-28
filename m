Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f48.google.com (mail-it0-f48.google.com
	[209.85.214.48])
	by mail.openembedded.org (Postfix) with ESMTP id 343E06059F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Sep 2017 11:08:34 +0000 (UTC)
Received: by mail-it0-f48.google.com with SMTP id c195so776540itb.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Sep 2017 04:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=o1bb3Mkacjn5FupCJUNe9Xfe+5RBG7m6Ug3N2T3VZxk=;
	b=iJvRSl+pS13KmRDc2YY6YeLFvddQCAwKND0FF7bJnlCA61Mil++K7SATaxAn949nu2
	YPqZQGVCAn7mOuFQiQK6cZfXZ1glDXMGCozfEKjUi58X1LVqnjQwQ5XeRyCIa3BAJfSC
	yg+iZVCi29bRhXsdsZic4VXG60bGJVEMVtJXNTD9jeQ5kOzjkWnDu8jWg2CGyyjh1AX4
	zYad+pcgtZggrt+/BdX3HkzW6YNcwOgItItrydT3sHDiTWCPTTOiNwgPfRcPX2kVVs/7
	5vuUVau6YDc/DEj9oSnB/1t+NzNiQDj6tGWvVQmosgJSKAJycgkMiQHFqZOMt1Lc6feb
	NwOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=o1bb3Mkacjn5FupCJUNe9Xfe+5RBG7m6Ug3N2T3VZxk=;
	b=gnLKM4Nn9oK5dSVfwUJeYBn8w1vYf+eDR64+262h9qWwwcqqdT5hxbaVFRQNBJWHaJ
	CgZyo5EKYFOQ2Xfl/3MfV2uQZm5WGSfSLsyr53CAUtT3Yi7xVplemtwyDh5/yzEP2IGc
	/IM3Jh70HEfeK0dWsNSFQO1l4UTFY2nadpCQprd2YbYu3n83NkX/jCWtLwIKh9xKLb/j
	C8TpQ7O/RLrjTzN8wYk8YlirsVep7eEUNew8lgyfVWqZ7ztqurK9edKcUlwese8Qmkz+
	g1KMckxjpB8/jD446AhuadQPze/cI0+yOrETqPz+YvVakL6FMVpQRR1Rd3k2BfNvbPcH
	YtoQ==
X-Gm-Message-State: AHPjjUgGr6N+8CcXaPAvbggWQsczAvkkrDjStK+vadzS98MwWqzmKjfb
	+WPCKt4AXzrrSCRLLA5QpsZcsm57yIp18vRp+N9P1A==
X-Google-Smtp-Source: AOwi7QDr0TXVi3NyBqVcvbAcplHO9OmZ096+70jIva2suAZTz2YTipK7OpHAnIJdWcktBzrwQv5T/wFnOoBNB7yOQ4Y=
X-Received: by 10.36.162.67 with SMTP id o3mr966772iti.27.1506596916061; Thu,
	28 Sep 2017 04:08:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.19.68 with HTTP; Thu, 28 Sep 2017 04:08:15 -0700 (PDT)
In-Reply-To: <1506593061-168725-1-git-send-email-li.zhou@windriver.com>
References: <1506593061-168725-1-git-send-email-li.zhou@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 28 Sep 2017 12:08:15 +0100
Message-ID: <CAJTo0LY4o9LEdO1R27-D=hE7R3frOF383K5LY3s2q83CzfCHFQ@mail.gmail.com>
To: Li Zhou <li.zhou@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] expect: Fix segfaults when Expect clib is used directly from C program
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
X-List-Received-Date: Thu, 28 Sep 2017 11:08:35 -0000
Content-Type: multipart/alternative; boundary="f403045fb2a200adfa055a3dee6d"

--f403045fb2a200adfa055a3dee6d
Content-Type: text/plain; charset="UTF-8"

On 28 September 2017 at 11:04, Li Zhou <li.zhou@windriver.com> wrote:

> +Upstream-Status: Backport
> +Backport from http://pkgs.fedoraproject.org/cgit/rpms/expect.git/commit/
> +?h=master&id=b6737eed550be93182f2ed194e836a6cbbcf4fa3


Another distribution patching a recipe does not make it a backport,
backports have to be from upstream.

Ross

--f403045fb2a200adfa055a3dee6d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 28 September 2017 at 11:04, Li Zhou <span dir=3D"ltr">&=
lt;<a href=3D"mailto:li.zhou@windriver.com" target=3D"_blank">li.zhou@windr=
iver.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=3D"=
gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex">+Upstream-Status: Backport<br>
+Backport from <a href=3D"http://pkgs.fedoraproject.org/cgit/rpms/expect.gi=
t/commit/
+?h=3Dmaster&amp;id=3Db6737eed550be93182f2ed194e836a6cbbcf4fa3" rel=3D"nore=
ferrer" target=3D"_blank">http://pkgs.fedoraproject.org/<wbr>cgit/rpms/expe=
ct.git/commit/<br>
+?h=3Dmaster&amp;id=3D<wbr>b6737eed550be93182f2ed194e836a<wbr>6cbbcf4fa3</a=
></blockquote><div><br></div><div>Another distribution patching a recipe do=
es not make it a backport, backports have to be from upstream.</div><div><b=
r></div><div>Ross=C2=A0</div></div></div></div>

--f403045fb2a200adfa055a3dee6d--
