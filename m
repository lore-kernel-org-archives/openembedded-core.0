Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com
	[209.85.166.43])
	by mail.openembedded.org (Postfix) with ESMTP id BB94D65CF3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Mar 2019 15:50:44 +0000 (UTC)
Received: by mail-io1-f43.google.com with SMTP id e13so8022867ioq.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Mar 2019 08:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=BnsMMF7wMjOZiYDekWqbRwLaIuI9gU8/J9NrN86X0Ss=;
	b=L5/H3+0Omyq315OLI+OW8q63Uioz/RM+2VhyqGrpLO/Z1Fz1SES1rU9CRzAzk+KMDm
	PsRBngqTAXhM1fqI9GHaTcSid4MxhyN/uASec1tk60Eh2oubYPsBUNvynAx5ieHLbVPX
	xGAcWxmI3ZV4dsKOx8esdrx7lqbC7d3uuVeIw0nv0rvHsOrGNa3h5vez6Aacr0gloZta
	B6mebs/E2jgyzo4lQglbzPE05XaFsmyzv8UzVaXPreb61TySXAST+TTLIcZ7ZoVsCd7q
	AAogK2UDufHeASquVtAks4Hgn9oZe6fYx88pUvfRXmn2p7bj0Jz4CZ1hTic/nXx+pvsZ
	VIwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=BnsMMF7wMjOZiYDekWqbRwLaIuI9gU8/J9NrN86X0Ss=;
	b=GEasnvCKmTzjZALhEeMBkjZzvkJ1WCfaGuSnjJkxuupCqodRixQT1pFLNEcDO9QzZu
	vUfOd7agU0NFX/D68rr3vjPQQaYtrb3qK+uJ97lKBL3PwhdA7TT5MVL4rNvQaKGk3RBP
	9u6RsFO9McgTcEt69gTt1xVXqm/onBWHzajNdojJ5crn6EEpC/87fdw6udefndUeduaT
	MLPno9trUNfK+Sm9hF7QV/jBARpLSapf79/bjGWdRPIWSt2qQYu128qpAVdNj1V2kIKO
	y4CilGdH97syGZw1sFlpXowdECaTm/sIP4+OkYE8A+oBSqQJgYCz7ib5WkXJ7RH31Ten
	65gA==
X-Gm-Message-State: APjAAAUGbDqBeDyJpJXXut5uNlWTdV0+fHgCeVvP/WTF/K7s0H2RelQc
	+wxXNc+GxnwIhfLevKH625mlHWhY2SdjjTosAHZOnA==
X-Google-Smtp-Source: APXvYqzf5DJmOH8Gj/SSJEPPNA906b1D7WKQ5SzRn8xO1mEAzt3o8Erb5WuC2Dj9nSb2VV03uabAaAzqj+rIobrD+9Q=
X-Received: by 2002:a5d:8795:: with SMTP id f21mr1883118ion.20.1553010645785; 
	Tue, 19 Mar 2019 08:50:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190319075451.18823-1-lu.jiang@windriver.com>
	<20190319075451.18823-3-lu.jiang@windriver.com>
	<613c27767a004365b122b1352321d88e@XBOX04.axis.com>
In-Reply-To: <613c27767a004365b122b1352321d88e@XBOX04.axis.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 19 Mar 2019 15:50:34 +0000
Message-ID: <CAJTo0LbRdu2fvjeUBt42gYn30Ks+Qb42j55=uW7c+tgaQZ-5Hg@mail.gmail.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-core 2/2] glib-networking:enable glib-networking complie as native package
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
X-List-Received-Date: Tue, 19 Mar 2019 15:50:45 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, 19 Mar 2019 at 15:37, Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
> > +do_install_append_class-native () {
> > +    for _pc in ${D}${libdir}/pkgconfig/*.pc; do
> > +        case $_pc in
> > +            *'*.pc') rm -fr ${D}${libdir}/pkgconfig;;
> > +            *.pc)    break;;
> > +        esac
> > +    done
>
> Why complicate things? Just remove the directory if it exists
> and is empty:
>
>         rmdir ${D}${libdir}/pkgconfig 2>/dev/null || :

Bikeshed!  Or

rmdir --ignore-fail-on-non-empty ${D}${libdir}/pkgconfig

Ross

