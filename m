Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-yw0-f174.google.com (mail-yw0-f174.google.com
	[209.85.161.174])
	by mail.openembedded.org (Postfix) with ESMTP id C576E77922
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Mar 2017 11:42:57 +0000 (UTC)
Received: by mail-yw0-f174.google.com with SMTP id v76so87777327ywg.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Mar 2017 04:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=iLLY5ynLBShrzz7rLroEjbBU+myOFLBKWMmHVCKc4e8=;
	b=IbASZuefnA2tdB25vu4/amN/FlikfS02/dgmejhRi+bR3QkDDv1Wa5q12NK7JeQYn9
	SuzKzhp0mX8lXlH+sofCxdy/e6Kp/e7Q84HgjgrieazWD2bo4CF8w3/BHLbfhNu8ukdK
	s9g/eBDNrNC8NEm2RP+/Myf5z6nJJMqrEzr+lmqdxy76qZSJLv2CHuZw7k0q3T6fLYXz
	7Kf+ZvDqAoHqxqFpkfgKbAIED/bYKOG/dY3ZUupoWCT5p6lzXpshxi11VBjRybtqUVZL
	l/HAYYkkZ9Hpk2CwJ+mG5xCcXwiHfTo5F2i3hFYEx5zXQDS1kwdZE2F577WmUuQWxWY/
	9F5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=iLLY5ynLBShrzz7rLroEjbBU+myOFLBKWMmHVCKc4e8=;
	b=kdM8D/cRQBFzX1CRxdY8vboI6FXS1r711BlFwbNylcbHGBCjHivyCiAOlLyvRQlS8v
	IZFDCRLhfR61UePTtHX7+/RbLONOwzv31UjG4E18R6554sL8HI/v1hze4Vw7H48zW290
	ZTWuS67nJimkDgSH7brZLBXPG4cVtz0TFkCvdi9PQWVWnDi7KyYuriKAh/LWetu8TpMN
	8JjhQqXGZWr9A0zoz8feFggYWDUnUIcR7lPEh3Lre82/8Xc6f3Mk4gHuWA98CWSEGJbh
	NFbizwCjuKf7PldPE27qv+8Q6616RV6xhATs+3SN18TcSsxkE+/jZ6qfIQ9OlTAUbCNf
	u2Fg==
X-Gm-Message-State: AFeK/H2mxuiC43JJoRYVxHQXQaSf6cduR3trh8VXPaj2pP0TfvgCtZkkkgyXmT/jHohRUtr3DFY7DRgdtB+rVKJi
X-Received: by 10.129.116.213 with SMTP id p204mr14743170ywc.151.1490010178440;
	Mon, 20 Mar 2017 04:42:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.129.81.136 with HTTP; Mon, 20 Mar 2017 04:42:28 -0700 (PDT)
In-Reply-To: <14EB1FFCA0C8D24A8B04EDEC1EA78C2458A130E3@XSJ-PSEXMBX01.xlnx.xilinx.com>
References: <cover.1487727826.git.liezhi.yang@windriver.com>
	<2702bdc3f6961ba31689d97d67e900f9865d40ee.1487727826.git.liezhi.yang@windriver.com>
	<ef157c32-b0e7-c487-e9de-57449c22b474@denx.de>
	<490a19b0-0d48-c090-685f-1edf1e017c4b@windriver.com>
	<14EB1FFCA0C8D24A8B04EDEC1EA78C2458A130E3@XSJ-PSEXMBX01.xlnx.xilinx.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Mon, 20 Mar 2017 13:42:28 +0200
Message-ID: <CAHiDW_FRhKQf9hny0htT25b8KUvJuQodEHnh6xkCrUyEbDZnPw@mail.gmail.com>
To: Manjukumar Harthikote Matha <manjukumar.harthikote-matha@xilinx.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/5] file: 5.29 -> 5.30
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
X-List-Received-Date: Mon, 20 Mar 2017 11:42:58 -0000
Content-Type: multipart/alternative; boundary=001a1147f5c065e6c8054b2807cc

--001a1147f5c065e6c8054b2807cc
Content-Type: text/plain; charset=UTF-8

On 20 March 2017 at 13:29, Manjukumar Harthikote Matha <
manjukumar.harthikote-matha@xilinx.com> wrote:

>
>
> > -----Original Message-----
> > From: openembedded-core-bounces@lists.openembedded.org
> > [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> > Robert Yang
> > Sent: Monday, March 20, 2017 3:14 PM
> > To: Stefano Babic; openembedded-core@lists.openembedded.org
> > Subject: Re: [OE-core] [PATCH 5/5] file: 5.29 -> 5.30
> >
> > Yes, file's upstream commit ID has changed, Paul has sent a patch for it:
> >
> > http://lists.openembedded.org/pipermail/openembedded-core/2017-
> > March/134261.html
> >
>
> Is it better to use nobranch=1 ?
> Changes in this file.git has broken Morty as well, we used nobranch=1 to
> resolve this issue.
> I haven't tested this for other released versions of Yocto.
>

This is band-aid at best: If you do a "cleanall" to force a new clone the
commits likely won't be there anymore.

Jussi

--001a1147f5c065e6c8054b2807cc
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 2=
0 March 2017 at 13:29, Manjukumar Harthikote Matha <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:manjukumar.harthikote-matha@xilinx.com" target=3D"_blank">m=
anjukumar.harthikote-matha@xilinx.com</a>&gt;</span> wrote:<br><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex"><span class=3D""><br>
<br>
&gt; -----Original Message-----<br>
&gt; From: <a href=3D"mailto:openembedded-core-bounces@lists.openembedded.o=
rg">openembedded-core-bounces@<wbr>lists.openembedded.org</a><br>
&gt; [mailto:<a href=3D"mailto:openembedded-core-bounces@lists.openembedded=
.org">openembedded-core-<wbr>bounces@lists.openembedded.org</a><wbr>] On Be=
half Of<br>
&gt; Robert Yang<br>
&gt; Sent: Monday, March 20, 2017 3:14 PM<br>
&gt; To: Stefano Babic; <a href=3D"mailto:openembedded-core@lists.openembed=
ded.org">openembedded-core@lists.<wbr>openembedded.org</a><br>
&gt; Subject: Re: [OE-core] [PATCH 5/5] file: 5.29 -&gt; 5.30<br>
&gt;<br>
&gt; Yes, file&#39;s upstream commit ID has changed, Paul has sent a patch =
for it:<br>
&gt;<br>
&gt; <a href=3D"http://lists.openembedded.org/pipermail/openembedded-core/2=
017-" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<w=
br>pipermail/openembedded-core/<wbr>2017-</a><br>
&gt; March/134261.html<br>
&gt;<br>
<br>
</span>Is it better to use nobranch=3D1 ?<br>
Changes in this file.git has broken Morty as well, we used nobranch=3D1 to =
resolve this issue.<br>
I haven&#39;t tested this for other released versions of Yocto.<br></blockq=
uote><div><br></div><div>This is band-aid at best: If you do a &quot;cleana=
ll&quot; to force a new clone the commits likely won&#39;t be there anymore=
.</div><div><br></div><div>Jussi</div><div><br></div></div></div></div>

--001a1147f5c065e6c8054b2807cc--
