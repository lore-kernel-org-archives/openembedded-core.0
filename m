Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f48.google.com (mail-oi0-f48.google.com
	[209.85.218.48])
	by mail.openembedded.org (Postfix) with ESMTP id 30C94605BE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Sep 2018 14:46:24 +0000 (UTC)
Received: by mail-oi0-f48.google.com with SMTP id l82-v6so8568290oih.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Sep 2018 07:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=k4saMNZtZrA/cgyz4bvIz6uiI87gZLW7aleiGWgfIHo=;
	b=KTIBk3IF7s7uQTIdM9kx1qXlRuM5krqe6SMKzLtvIqJ6aaQCmK8Ggql2H51QkI/+xp
	Vcq/Ik/mHsgZmT8yCX/u3EQe6rVv4JhF+FJECZQb2tn3nSQSWO/19Az615Ic12Jo7Chz
	b8iVL7OvIGANqaIlQxFquPbxTW4UyOBkyyorsuL3Bb4k4RGmh84nfbxOxIJUfUppTsYN
	WM4H0fFqF3jqwHmm+Ceq/57zQrK2ws6d31Re4kT0d0ylSxv3i0OtfQc8Y9lKj0XQL6mC
	Dw207Ujlrd87vT5Rdxo8b3toTt19KTSWMlgZ8db3D8VMpTo2vwBBH9oyCgxPf/Kv4SV2
	9iDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=k4saMNZtZrA/cgyz4bvIz6uiI87gZLW7aleiGWgfIHo=;
	b=fnG55bhiDkA2DxwLUnFLuHU2ievFMgecVZtUE6koN/LxaRFrgGglJC81Ma2o1tMKeF
	0mBjssBb/oQ/XvXTNDYAMRu9qJTYf/RYk4ZV/PMlWMvX+Uu7Gr2EkMLMlsXbm9xjF3n6
	ao8T58N0vXcNtvCRL/6EUdhQPXPL8AP0Tuc9XAeI9TwzNlwu/KBaWn51x3CaHUbRQ2ac
	XmZcYjNzFkCLWjYgVw422U6wonwuCAyHJ86o5kWM5aHvSXJhl1yt8eyGakVi3JmM1WCQ
	8/+t58BgkrYvCezFjCxvQ6nuuoSitUFtAUu+3Y9t32YLQaYf0WpSxzSli7zcruigQrwK
	yf7w==
X-Gm-Message-State: APzg51CVL2j+DCcZh0Zt6DdIJXNW7dvLBzbhkOkBPoj4BkPIZy++y/d4
	/2+24Hck/L0n+HeXtQPFDjnE8Vu8kyVi1B4Qxj5tfA==
X-Google-Smtp-Source: ANB0VdZzOjSPU0CkFyzJqswYwhAZw5LFnqVv/ddMdt44Nqm0PcWR68eVviMO1XaRyvaD5ZsJHlT1kyq47uSzMWxsGqE=
X-Received: by 2002:aca:d7c2:: with SMTP id
	o185-v6mr1852437oig.55.1537454785874; 
	Thu, 20 Sep 2018 07:46:25 -0700 (PDT)
MIME-Version: 1.0
References: <1537266969204.31967@mentor.com>
	<CAJTo0LbCJwoD8Rc4uLffTx5P0enQxppY4-5YmGYPDbhahU8j8A@mail.gmail.com>
	<9a58ea4be84c4f0eb2c34680a9345186@SVR-IES-MBX-03.mgc.mentorg.com>
In-Reply-To: <9a58ea4be84c4f0eb2c34680a9345186@SVR-IES-MBX-03.mgc.mentorg.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 20 Sep 2018 15:46:14 +0100
Message-ID: <CAJTo0LYtN8Rn=Kw1opw9=-a9j2zFFaUqikvwU4LXqoqHiEot5Q@mail.gmail.com>
To: "Belal, Awais" <Awais_Belal@mentor.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glibc-package.inc: correct intention for deleting /usr/lib as needed
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
X-List-Received-Date: Thu, 20 Sep 2018 14:46:25 -0000
Content-Type: text/plain; charset="UTF-8"

That's better than HTML!
On Thu, 20 Sep 2018 at 15:04, Belal, Awais <Awais_Belal@mentor.com> wrote:
>
> Hi Ross,
>
> >> Can you resend using git-send-email, as this patch is encoded in HTML.
> My SMTP server is acting up these days, should I simply resend the patch here as an attachment?
>
> BR,
> Awais
>
> ________________________________________
> From: Burton, Ross [ross.burton@intel.com]
> Sent: Thursday, September 20, 2018 4:10 PM
> To: Belal, Awais
> Cc: OE-core
> Subject: Re: [OE-core] [PATCH] glibc-package.inc: correct intention for deleting /usr/lib as needed
>
> Can you resend using git-send-email, as this patch is encoded in HTML.
>
> Ross
> On Tue, 18 Sep 2018 at 11:53, Belal, Awais <Awais_Belal@mentor.com> wrote:
> >
> > In case the baselib is lib64 we would want to delete /usr/lib
> > after removing the /usr/lib/locale dir and the implementation
> > wanted to do that earlier as well but the fault was checking
> > an already removed dir (/usr/lib/locale) before trying to
> > remove /usr/lib as that check would always fail.
> > Now we simply try to delete /usr/lib after deleting
> > /usr/lib/locale to make sure it deletes cleanly and is empty
> > at the time of deletion.
> >
> > Signed-off-by: Awais Belal <awais_belal@mentor.com>
> > ---
> >  meta/recipes-core/glibc/glibc-package.inc | 9 ++++-----
> >  1 file changed, 4 insertions(+), 5 deletions(-)
> >
> > diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
> > index 9ea41b7..22a59d2 100644
> > --- a/meta/recipes-core/glibc/glibc-package.inc
> > +++ b/meta/recipes-core/glibc/glibc-package.inc
> > @@ -207,11 +207,10 @@ do_poststash_install_cleanup () {
> >      rm -rf ${D}/${localedir}
> >      rm -rf ${D}${datadir}/locale
> >      if [ "${libdir}" != "${exec_prefix}/lib" ]; then
> > -        if [ -d ${D}${exec_prefix}/lib/locale ] ; then
> > -            rm -rf ${D}${exec_prefix}/lib/locale
> > -            # error out if directory isn't empty
> > -            rm -f ${D}${exec_prefix}/lib
> > -        fi
> > +        # error out if directory isn't empty
> > +        # this dir should only contain locale dir
> > +        # which has been deleted in the previous step
> > +        rmdir ${D}${exec_prefix}/lib
> >      fi
> >  }
> >  addtask do_poststash_install_cleanup after do_stash_locale do_install before do_populate_sysroot do_package
> > --
> > 2.7.4
> >
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core

