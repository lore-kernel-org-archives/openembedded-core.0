Return-Path: <daiane.list@gmail.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id 9F43A6B19D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2013 14:12:32 +0000 (UTC)
Received: by mail-pa0-f48.google.com with SMTP id kp12so3254850pab.21
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2013 07:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=3LRibVDHRUpp5r5COpwb6WjIUE/zho5J9EPIdOWppt0=;
	b=TrmZ12xGkqkZoGrH/900FjwrdMH96B9Ebt5Ow/UDsbkveV7ckR3pw4XRRXGdKUNLsi
	649GCNkCPpjt4M7jp++ej0Hi2/c+ck86Z7yT+JBrkx4D0yBXYanjY/tc21Euxi5N5BZX
	TwkLbhiw5oUSfOrGudjoJLqNv5KZUb01mGm612q8hFqjyHhSRY3hndjomlNihBS/WpEc
	NavtKOMrqCJh4S8fGeZ6f7soPvHTUYnDAIdwKDP7yrp+n9LKCXke/A7ortFf5SOivvCR
	G1e7kbxbaZNBUCQRkyRdFnKtApHLPUPWd14j5bF944nAw0cJGdijQgMd7y5zACbMIA6y
	dLvg==
MIME-Version: 1.0
X-Received: by 10.68.13.42 with SMTP id e10mr12281701pbc.23.1374156753689;
	Thu, 18 Jul 2013 07:12:33 -0700 (PDT)
Received: by 10.70.20.225 with HTTP; Thu, 18 Jul 2013 07:12:33 -0700 (PDT)
In-Reply-To: <CAJTo0La40j24AqhFxuZMmjHe9cF6Ssr-jV2D7hhRCMKbLeyLnA@mail.gmail.com>
References: <CA+jg_OV-i-dRAw92j2dXsodfi5=EmXSnFuA-GVvRCJYbEbS=gg@mail.gmail.com>
	<CAJTo0LaDbFWTXQ0NPtjQ-LMt+B+ZABRG17Ed3BW1=mH2Bv3jgQ@mail.gmail.com>
	<CAP9ODKqDSUs8gx1tKbSGT89Ap_hPX6xeD4DKteXKhxNO681Ymw@mail.gmail.com>
	<CAJTo0La40j24AqhFxuZMmjHe9cF6Ssr-jV2D7hhRCMKbLeyLnA@mail.gmail.com>
Date: Thu, 18 Jul 2013 11:12:33 -0300
Message-ID: <CA+jg_OXXS4UAojhcgZ3vO5ZeMoHsHEQ=0LCz1GVyGDbcTJJKUQ@mail.gmail.com>
From: Daiane Angolini <daiane.list@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: No package 'cairo' found for GTK+
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
X-List-Received-Date: Thu, 18 Jul 2013 14:12:32 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Jul 18, 2013 at 10:39 AM, Burton, Ross <ross.burton@intel.com> wrote:
> On 18 July 2013 14:25, Otavio Salvador <otavio@ossystems.com.br> wrote:
>> On Thu, Jul 18, 2013 at 10:13 AM, Burton, Ross <ross.burton@intel.com> wrote:
>>> On 18 July 2013 13:33, Daiane Angolini <daiane.list@gmail.com> wrote:
>>>> I'm facing the following error. Anyone know what I should try in order
>>>> | configure: error: Package requirements (glib-2.0 >= 2.28.0    atk >=
>>>> 1.29.2    pango >= 1.20    cairo >= 1.6    gdk-pixbuf-2.0 >= 2.21.0)
>>>> were not met:
>>>> |
>>>> | No package 'cairo' found
>>>
>>> cairo is a build dependency on GTK+, so I'd recommend having a look at
>>> the config.log file it generated and see if that has any hints.
>>
>> Well, the error seems very clear. cairo pkgconfig is not found.
>
> Yes.  And as I said, cairo is a build dependency of GTK+:
>
> DEPENDS = "glib-2.0 pango atk jpeg libpng gdk-pixbuf-native
> docbook-utils-native \
>  cairo gdk-pixbuf

Thanks for your feedback, Ross.

Even if I run bitbake cairo just before I bitbake my image I get this error.

I do have cairo:
bitbake --show-versions | grep cairo
cairo                                             :1.12.14-r0
cairo-native                                      :1.12.14-r0
cairomm                                            :1.10.0-r1
cairomm-native                                     :1.10.0-r1
python-pycairo                                     :1.10.0-r2


What I don't understand, is how bitbake seems to avoid it

>
> We need to see the detailed config.log to see *why* it can't find it.
> Maybe there's a dependency in cairo.pc that the recipes don't know
> about.

How should I send it? Could I attach the log.do_configure to maillist?

>
>> Did you build GTK lately Ross?
>
> Daily, and just to be sure, about 20 seconds ago.
>
> Ross


Daiane

