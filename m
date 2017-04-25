Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f170.google.com (mail-qk0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id 411D172F9C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Apr 2017 14:46:40 +0000 (UTC)
Received: by mail-qk0-f170.google.com with SMTP id y63so116972685qkd.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Apr 2017 07:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=9WyFVbB6oyA1kw8hBrYy2MhzYLAv9qWHHu8H1UNeaS8=;
	b=xIWTePXVndNJdSxT/RCCS/bsaS/dSJ6RCQajifiD6i7c4lk/16VvI/rX3EAQ13wtU/
	+N5IHQBnxdLQ90l+OaSWActN6CFOEI9aIQ5Vz2yXz9xRKUwxymb1EX+NsP79wIcj3c/k
	2XwxqAW6jLeR0BEfhXOyYOuPmluO4YR8NODDYzeYowXOR828ip6cIWkCTlgqhTa//eLv
	1W8Wb9hS++FsLdweZ3roxBo1GJYNjSxCvCOiN69XR7C7N27p6MMEBHG2RCFalaXu9iss
	9JQobf8u2CqN2/ATPfpsmRVC/w+9Q1ufYNNYyIUqxMQWBy/7UG/0ir5Ywlmp4uN8Uw5e
	h1sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=9WyFVbB6oyA1kw8hBrYy2MhzYLAv9qWHHu8H1UNeaS8=;
	b=do/jG+ZQtDDtERQYtlDzvy2gpf4RgrmYHkiCvNy7GEJO8S3jPVhFWFmUg5C2vT6pNB
	uOSNKYqOvutaAnc70viyCENMtO7LQp3gdNg1+bHRHYPBAQsDfVsB7u2n7zmFJESeuZVd
	9hlnonUAla2POmskob/Eq3l5p2M7yPa1jPORBb2qujDAPob9koT+xuunCYyaJ6pFOP1A
	u6rbGkvMGOYrCbX5PZJeN8OVUCX5SxlRTVIvzQJQ39497DwzhyZPL6QVsKw2i8MD330Y
	BwJ3ag/M/+i285x1LMpjhu7GP2Z9hg/vsPaJwpgo8HuLPApQlowUb954xxxuXE8Cyar/
	xBrg==
X-Gm-Message-State: AN3rC/6mLNxxbgJgwHuDSdaHmB/Nv7MiiQC2PULOznr6rqPcHkQRuwq1
	gMucUQXjko3rJgbs1NcYzpoP859fUzeR
X-Received: by 10.55.93.193 with SMTP id r184mr28701492qkb.221.1493131602231; 
	Tue, 25 Apr 2017 07:46:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Tue, 25 Apr 2017 07:46:21 -0700 (PDT)
In-Reply-To: <1492999954-21326-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
References: <1492999954-21326-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 25 Apr 2017 15:46:21 +0100
Message-ID: <CAJTo0La1rkbxY8=OdMO=pW92LHUmTHsaGeWDfd_f-0kxAACfFg@mail.gmail.com>
To: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gperf: 3.0.4 -> 3.1
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
X-List-Received-Date: Tue, 25 Apr 2017 14:46:41 -0000
Content-Type: multipart/alternative; boundary=001a114ed8eec13c7f054dfecaa4

--001a114ed8eec13c7f054dfecaa4
Content-Type: text/plain; charset=UTF-8

On 24 April 2017 at 03:12, Huang Qiyu <huangqy.fnst@cn.fujitsu.com> wrote:

> Upgrade gperf from 3.0.4 to 3.1.
>

This breaks the libcap build:

| In file included from <command-line>:0:0:
| ./_caps_output.gperf:71:80: error: unknown type name 'size_t'
|  gperf_case_strncmp (register const char *s1, register const char *s2,
register size_t n)
|
      ^~~~~~
| ./_caps_output.gperf:96:53: error: unknown type name 'size_t'
|  __cap_hash_name (register const char *str, register size_t len)
|                                                      ^~~~~~
| ./_caps_output.gperf:200:55: error: unknown type name 'size_t'
|  __cap_lookup_name (register const char *str, register size_t len)
|                                                        ^~~~~~
| ./_caps_output.gperf:200:1: error: conflicting types for
'__cap_lookup_name'
|  __cap_lookup_name (register const char *str, register size_t len)
|  ^~~~~~~~~~~~~~~~~
| ./_caps_output.gperf:33:29: note: previous declaration of
'__cap_lookup_name' was here
|  const struct __cap_token_s *__cap_lookup_name(const char *, unsigned
int);
|                              ^~~~~~~~~~~~~~~~~

gperf 3.1 changed a type from int to size_t, so there's a missing header
include.  Can you also fix libcap?

Ross

--001a114ed8eec13c7f054dfecaa4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 24 April 2017 at 03:12, Huang Qiyu <span dir=3D"ltr">&lt;<a href=3D"mail=
to:huangqy.fnst@cn.fujitsu.com" target=3D"_blank">huangqy.fnst@cn.fujitsu.c=
om</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;border-l=
eft-color:rgb(204,204,204);padding-left:1ex"><div id=3D"gmail-:60e" class=
=3D"gmail-a3s gmail-aXjCH gmail-m15b9dbc8622bf56d">Upgrade <span class=3D"g=
mail-il">gperf</span> from 3.0.4 to 3.1.<br></div></blockquote></div><br>Th=
is breaks the libcap build:</div><div class=3D"gmail_extra"><br></div><div =
class=3D"gmail_extra"><div class=3D"gmail_extra">| In file included from &l=
t;command-line&gt;:0:0:</div><div class=3D"gmail_extra">| ./_caps_output.gp=
erf:71:80: error: unknown type name &#39;size_t&#39;</div><div class=3D"gma=
il_extra">| =C2=A0gperf_case_strncmp (register const char *s1, register con=
st char *s2, register size_t n)</div><div class=3D"gmail_extra">| =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~</div><div class=
=3D"gmail_extra">| ./_caps_output.gperf:96:53: error: unknown type name &#3=
9;size_t&#39;</div><div class=3D"gmail_extra">| =C2=A0__cap_hash_name (regi=
ster const char *str, register size_t len)</div><div class=3D"gmail_extra">=
| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~</div><div class=3D"gmail_ex=
tra">| ./_caps_output.gperf:200:55: error: unknown type name &#39;size_t&#3=
9;</div><div class=3D"gmail_extra">| =C2=A0__cap_lookup_name (register cons=
t char *str, register size_t len)</div><div class=3D"gmail_extra">| =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~</div><div class=3D"gmail_ex=
tra">| ./_caps_output.gperf:200:1: error: conflicting types for &#39;__cap_=
lookup_name&#39;</div><div class=3D"gmail_extra">| =C2=A0__cap_lookup_name =
(register const char *str, register size_t len)</div><div class=3D"gmail_ex=
tra">| =C2=A0^~~~~~~~~~~~~~~~~</div><div class=3D"gmail_extra">| ./_caps_ou=
tput.gperf:33:29: note: previous declaration of &#39;__cap_lookup_name&#39;=
 was here</div><div class=3D"gmail_extra">| =C2=A0const struct __cap_token_=
s *__cap_lookup_name(const char *, unsigned int);</div><div class=3D"gmail_=
extra">| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~~~~~~~~~~~~</div><div class=3D"=
gmail_extra"><br></div><div class=3D"gmail_extra">gperf 3.1 changed a type =
from int to size_t, so there&#39;s a missing header include.=C2=A0 Can you =
also fix libcap?</div><div class=3D"gmail_extra"><br></div><div class=3D"gm=
ail_extra">Ross</div></div></div>

--001a114ed8eec13c7f054dfecaa4--
