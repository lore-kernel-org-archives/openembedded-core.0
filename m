Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id 7240C73CC7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Aug 2015 20:49:25 +0000 (UTC)
Received: by iodv127 with SMTP id v127so23602304iod.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Aug 2015 13:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=/Z7USu3nCjm56Nzgh0YEhA8Cio+cFpNHWlwB0WBXRzU=;
	b=ThFRhwbiyX9xF7LKQjiNGZoR9pcw4tQ5g9KuGgkASnmaXEhred6XHqdQ4XidvpPLg7
	KhgMGgEa1HDsHmqjQ1D5rqb1WLQ5KhyKELYG7wSneAq8FfDsgkl7tUpzpWfFxri3M+w8
	YEBGHWDr2zjiiqqxTNVpd2zsRPgLrpu91yW4gSp6g6uMDBjyY9h67SiLZ++znmO3iZBO
	W/qE1Q/nkRCKux0YBPRH8KpvTXX48FtZ+ijAS6RKkAAmI+P4ygc+PcOHirMS3xwjXtno
	Cn8ZvGS4WFOgU8nHuBGLWIrdLxYfNh6vAsXpoiblm6xhHOcNj3o1/TyAv2caONZq+uwr
	xTAg==
MIME-Version: 1.0
X-Received: by 10.107.6.166 with SMTP id f38mr13522167ioi.148.1440017366219;
	Wed, 19 Aug 2015 13:49:26 -0700 (PDT)
Received: by 10.36.98.5 with HTTP; Wed, 19 Aug 2015 13:49:26 -0700 (PDT)
In-Reply-To: <CAJTo0LZM7CYkywWvLJJC6v2NLWxXJrm-+AZMD0KkLNfiSUpxUw@mail.gmail.com>
References: <cover.1439991562.git.alexander.kanavin@linux.intel.com>
	<68fe672e09b44fb814b733199c4058e3cce78bf0.1439991562.git.alexander.kanavin@linux.intel.com>
	<CALbNGRTnJfkUDJSyH4-v3642e_=ea3m4-JAb6znDLUbpn0w+yQ@mail.gmail.com>
	<CAJTo0LZM7CYkywWvLJJC6v2NLWxXJrm-+AZMD0KkLNfiSUpxUw@mail.gmail.com>
Date: Wed, 19 Aug 2015 22:49:26 +0200
Message-ID: <CALbNGRR9QW5a80pXNq-3US4smFQuUaFwEKf=cZNF-X348AZxOw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 05/22] libnotify: update to version 0.7.6
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
X-List-Received-Date: Wed, 19 Aug 2015 20:49:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 19, 2015 at 10:37 PM, Burton, Ross <ross.burton@intel.com> wrot=
e:
>
> On 19 August 2015 at 21:23, Andreas M=C3=BCller <schnitzeltony@googlemail=
.com>
> wrote:
>>
>> What about
>>
>> REQUIRED_DISTRO_FEATURES =3D "x11"?
>
>
> libnotify doesn't depend on X anymore.
>
> Ross
Sorry for this but it should be mentioned then and inherit
distro_features_check should go.

Andreas

