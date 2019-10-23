Return-Path: <schnitzeltony@gmail.com>
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by mail.openembedded.org (Postfix) with ESMTP id B30547F82F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Oct 2019 13:21:20 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id t18so20740796iog.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Oct 2019 06:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=tMwZmvTwOE8op4Y16DWOPyQXHPof6F6Q4sFhaUXxh7w=;
	b=Xe2gHpZ99SCZTyMCH8UdvAQZe41F4lyURoKBNrguFkKIw23vgH85d8z7oE+fG3nogz
	NF4L3Fn8BHEQIW0fQiTrFbR++8wlZF39kwstqCy/pu2E7f5J25Vzh5agRBUoB6eC8655
	KIDBuaXJDkcd6ulN7jMU/nLDPG5aRgyk8kWneTGpUz0iAIREy6wHXDqLYUX06oOxjEny
	/J8+XTd4+maek5oUAGmkd55n/u06CNZn2Hg3N7RSoXnJbnMZ0eZjxSv+2aV7CreC/9UI
	IeOHJfDc0JP6fn8+9VOaU7qj/dIl4zbhg2ElLtPccaYDyh21ACWL87M+SlV5RKDBdwkj
	yIaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=tMwZmvTwOE8op4Y16DWOPyQXHPof6F6Q4sFhaUXxh7w=;
	b=kM41n0BcYtRV1lzvgIpl816qY0KQqmPn3V/S1O9q/7ZKaClNzA05LzwY1phbZitCxA
	+Mafb6uPfC26SVC+dZwk0LKh/EWnrMptEDHJz0Cbj+BojgbOeW09iUwC5PzW7uA6wjzM
	6QL1DJypWt+Ye9gcy9wS/PitHxEfO4EpyBO4x1hjDAi9lXFnxvo6wYgHL4dMmrNT5xEO
	mtPGSizawxcFmPkZ18HITDjPCKx8Pgz5BSnaemeYUQTnJTAAK8MtJB/2UmAUIlbsg20H
	cEWCVRdX/xkv05bU0mxplBk2vwpZdnwmrCPbf9uZCqftyrbMEZzIDH8tpde0R2/B0KKJ
	KxoA==
X-Gm-Message-State: APjAAAXHe+pQSvS5V+re5+9txToinFdVbl3MB8Y4dVKosBjbC9/gi+c7
	ufJCJZo/iDQd18Ko+fjUQ2HrbrY/LslG3kQTBh4=
X-Google-Smtp-Source: APXvYqyUyYjSjCyoGctACdfnXHl0gGDp/6Dg5rpDFZ+8pUZwxNcGM8A8tD5huYSNsb6RiwzM4GXgdHksY2lDXfZqlUM=
X-Received: by 2002:a02:c9cb:: with SMTP id c11mr9187627jap.81.1571836881703; 
	Wed, 23 Oct 2019 06:21:21 -0700 (PDT)
MIME-Version: 1.0
References: <20191019202140.9537-1-schnitzeltony@gmail.com>
	<c1482d1a-3c1f-b379-4713-ae18b60c10ca@intel.com>
In-Reply-To: <c1482d1a-3c1f-b379-4713-ae18b60c10ca@intel.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Wed, 23 Oct 2019 15:21:10 +0200
Message-ID: <CALbNGRRAXSRajQbFBXk-KHunuxrhf2=-wORSTDbe93=vDCophg@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] gsettings-desktop-schemas: upgrade 3.32.0 -> 3.34.0
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
X-List-Received-Date: Wed, 23 Oct 2019 13:21:20 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 23, 2019 at 2:11 PM Ross Burton <ross.burton@intel.com> wrote:
>
> > -DEPENDS = "glib-2.0"
> > +DEPENDS = "glib-2.0 gcr"
>
> I can't see a gcr dependency in the source, and it builds fine with gcr
> removed.  Why was this added?
>
> Ross
Checked sources and I agree. I must have mixed up the warning with
another recipe's warning.

Will test again and send V3 tonight

Andreas

