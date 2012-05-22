Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1SWpX2-0000gK-M9
	for openembedded-core@lists.openembedded.org;
	Tue, 22 May 2012 15:53:48 +0200
Received: by obhx4 with SMTP id x4so10754102obh.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 May 2012 06:43:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:from:date
	:message-id:subject:to:content-type:x-gm-message-state;
	bh=e3YO0ZGasFA+dnCk9MhRetUzdiL4tmRPiU7bBZZuKhE=;
	b=PxX/DZreo6SRFgD9R8r76k64clzFYmfo6kWYDjaXSIAORauOpYE7cbrYiK/tYFe7GO
	UbgBU3Vyc2bY8Fx2V+jjyzTlRUo+c9A6D89jqD80JvYBWHSPdQ261McyiKN9cySNMoFp
	TaL403KwNivNrm5wUPyKYi569T4lPxJHH+6WURMu8PxeBBUBfIbLJ6C96842y1ORU8pm
	08OqQEzHNFcPmU9blyvwA6R7IEAYlthHlmhKB35Su98GmW3DO3PsiOayy3p1P4KG2Wgr
	1AmHkMJ0SRPXJEr7ne0XwJWiWBC/n0Fux8HHMvlq0VHzDKboQjm6gQQUJdahDMCWV1Xi
	jwjA==
Received: by 10.182.111.39 with SMTP id if7mr22627636obb.55.1337694219321;
	Tue, 22 May 2012 06:43:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.76.92.72 with HTTP; Tue, 22 May 2012 06:43:19 -0700 (PDT)
X-Originating-IP: [89.121.200.106]
In-Reply-To: <1337692801.8248.0.camel@ted>
References: <CAK18fxECi+PxHhW8pAm2URRE1ZF=h2_gEPXMvvioTQnhKGWYHw@mail.gmail.com>
	<CADkTA4MXvMJt=JhDKdjDR9o3nkYVWmfnEmRnC1cheju6Tbh0Sw@mail.gmail.com>
	<4FB50005.7000807@gherzan.ro>
	<CAPhnLPDzZfuRBKxR3Ru+2nvozRy4evhmtFUf2d-NmqNwY4RjZw@mail.gmail.com>
	<CAK18fxH5H5En0H+k7VccgGUCPApwcL7Xs+RV=1=pvRu_wRYXVQ@mail.gmail.com>
	<CAPhnLPBSsP3acUN1uZvPDVCq6PzXF8mGGsFyvgdbfz6EuZ_RSA@mail.gmail.com>
	<CAK18fxHfOZ0y07uuRfu6CVPR6KGbbH_NhEd8-HM-17sro3hAkw@mail.gmail.com>
	<1337692801.8248.0.camel@ted>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Tue, 22 May 2012 16:43:19 +0300
Message-ID: <CAK18fxGQ_4mvFm-8b6K-Wr-84HLUSjhouAv9ZQh4xrUr52paPw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQlM5cxwDjwD9W8FD/5YsoLj6M497ZopgqKm/Qc+7PT/OpMp7FAUdTdey/2PtTxFe0pE3fb1
Subject: Re: Linux-yocto 3.0 crashes at do_patch...
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 22 May 2012 13:53:48 -0000
Content-Type: multipart/alternative; boundary=14dae9399087c2c04e04c0a03474

--14dae9399087c2c04e04c0a03474
Content-Type: text/plain; charset=ISO-8859-1

This one above was on a clean DL_DIR.

@g



On Tue, May 22, 2012 at 4:20 PM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Tue, 2012-05-22 at 13:02 +0300, Andrei Gherzan wrote:
> > Even after using your workaround i can still reproduce this issue.
> > Yocto linux still fails.
> >
> > | ERROR. Could not find an excutable target for yocto/standard/base
> > | ERROR. Could not locate meta series for yocto/standard/beagleboard
> > | ERROR. Could not modify yocto/standard/base
> > NOTE: package linux-yocto-3.0.24+git1
> > +34e0d2b4b4e9778b31f9ea99ca43f0dc71a7ee23_1
> > +6b4bf6173b0bd2d1619a8218bac66ebc4681dd35-r4: task do_patch: Failed
> > ERROR: Task 3
> > (/media/HDD/yocto/poky/meta/recipes-kernel/linux/linux-yocto_3.0.bb,
> > do_patch) failed with exit code '1'
>
> Have you tried this against a clean DL_DIR so there is no risk of any of
> the files contained within there being corrupted?
>
> We need to get to the bottom of this but most people who were reporting
> issues have reported this as resolved now...
>
> Cheers,
>
> Richard
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

--14dae9399087c2c04e04c0a03474
Content-Type: text/html; charset=ISO-8859-1

This one above was on a clean DL_DIR.<div><br></div><div>@g<br><br>
<br><br><div class="gmail_quote">On Tue, May 22, 2012 at 4:20 PM, Richard Purdie <span dir="ltr">&lt;<a href="mailto:richard.purdie@linuxfoundation.org" target="_blank">richard.purdie@linuxfoundation.org</a>&gt;</span> wrote:<br>

<blockquote class="gmail_quote" style="margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div class="im">On Tue, 2012-05-22 at 13:02 +0300, Andrei Gherzan wrote:<br>
&gt; Even after using your workaround i can still reproduce this issue.<br>
&gt; Yocto linux still fails.<br>
&gt;<br>
&gt; | ERROR. Could not find an excutable target for yocto/standard/base<br>
&gt; | ERROR. Could not locate meta series for yocto/standard/beagleboard<br>
&gt; | ERROR. Could not modify yocto/standard/base<br>
&gt; NOTE: package linux-yocto-3.0.24+git1<br>
&gt; +34e0d2b4b4e9778b31f9ea99ca43f0dc71a7ee23_1<br>
&gt; +6b4bf6173b0bd2d1619a8218bac66ebc4681dd35-r4: task do_patch: Failed<br>
&gt; ERROR: Task 3<br>
&gt; (/media/HDD/yocto/poky/meta/recipes-kernel/linux/<a href="http://linux-yocto_3.0.bb" target="_blank">linux-yocto_3.0.bb</a>,<br>
&gt; do_patch) failed with exit code &#39;1&#39;<br>
<br>
</div>Have you tried this against a clean DL_DIR so there is no risk of any of<br>
the files contained within there being corrupted?<br>
<br>
We need to get to the bottom of this but most people who were reporting<br>
issues have reported this as resolved now...<br>
<br>
Cheers,<br>
<br>
Richard<br>
<div class="HOEnZb"><div class="h5"><br>
<br>
<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href="mailto:Openembedded-core@lists.openembedded.org">Openembedded-core@lists.openembedded.org</a><br>
<a href="http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core" target="_blank">http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core</a><br>
</div></div></blockquote></div><br></div>

--14dae9399087c2c04e04c0a03474--
