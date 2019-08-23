Return-Path: <loic.poulain@linaro.org>
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
	[209.85.208.52])
	by mail.openembedded.org (Postfix) with ESMTP id E933C7F2E9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2019 09:49:00 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id s49so12597857edb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2019 02:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=jjw7FBasAZ+KwsuL130mPaJ8faTiwifvSrfWhcACDHw=;
	b=piXWEwwt6UaGU79XG16oEW8rM9DYt4in0lyN6e9si9BDrSN5fIgnnVJmA1nYbfLQlw
	LUfsY6tdE7n7qirDoIPBbRoIG1eWm64e82/r95VXMduKyZ+CJTyI2wDEGTpXRuI4d7K5
	GjFxwAdDbWBAmNszs+jTWlwfdgmfkICClAaOng52DzIYdWqy4OqUybhj+o4wsDByQxB5
	ZM8WTEME/xBjCS0V7QmamTj2PDywJjjakhk4g4XGkJ0QLNFgiAj8ue6ThpkKO5I26fVH
	APtxrl16rvoRInLXWq1ZxCLQSURA4i9MfrB/j74kwl6Fut22Z5znZ5dWx4azFeax+5VH
	CqCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=jjw7FBasAZ+KwsuL130mPaJ8faTiwifvSrfWhcACDHw=;
	b=CeZOKv5Bv6DxSN0egVIe46CNlKDlrGC2zD83xL/Ne8XLH4KZFIR+2prb2pfII7R7Zs
	4gzYh77omV4O8yYN8jHtwOAFHXcne7duSq79mYeSr2mdyfUB41d3X9FZdkBMpBMt1Km1
	lnEbFwRPFnzKagHzd0N4D3lH48f/8lmbTaMo8NND2HjBb6H+XcuYEIsX+og8hjMMOsCD
	n+e4I6mj1XxHdXNEOyTO2VwevwrsmyWl/eG9NDOmHm1Mbd37yW7xSuLKEXQeljCDgE9y
	KfTkCBVV582F5ld2ACcU7C4Dt5Zb1MsFZKMWW++Vmiw3u80UDUqFIBsOFdnzuXFwGr9j
	bKig==
X-Gm-Message-State: APjAAAUi78C8RnHSALEdIj0p26U6ULkBrcQmsdQt1MQITyIT9QhYX+2Y
	SwvK7THIYgTFv8/HcI5KBtzrYTEse6qomlDyenasdmfqatU=
X-Google-Smtp-Source: APXvYqyzvH0917bnEayOC38bB5X2N3dCpSqHF0YJw0OAicuP6aWSovQ38UL6nX7MLIwkxRyjqXLaRVjrmhyrVLFH1Jw=
X-Received: by 2002:a50:9f81:: with SMTP id c1mr3531914edf.100.1566553741567; 
	Fri, 23 Aug 2019 02:49:01 -0700 (PDT)
MIME-Version: 1.0
References: <CAMZdPi_2=mFZFgwzUVis4BE7P3C4boOZmVB6_eYeLCaT0wLJaA@mail.gmail.com>
	<CY4PR12MB1653873989F017FCB269F5DD8BDA0@CY4PR12MB1653.namprd12.prod.outlook.com>
In-Reply-To: <CY4PR12MB1653873989F017FCB269F5DD8BDA0@CY4PR12MB1653.namprd12.prod.outlook.com>
From: Loic Poulain <loic.poulain@linaro.org>
Date: Fri, 23 Aug 2019 11:49:46 +0200
Message-ID: <CAMZdPi8UpHvtBfiC4BFAr7z4NT6+kbyQdos-HB0s5Pgd3NgaFQ@mail.gmail.com>
To: "chris.laplante@agilent.com" <chris.laplante@agilent.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Automatic prebuilt management
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
X-List-Received-Date: Fri, 23 Aug 2019 09:49:01 -0000
X-Groupsio-MsgNum: 128184
Content-Type: multipart/mixed; boundary="00000000000049da250590c5b786"

--00000000000049da250590c5b786
Content-Type: multipart/alternative; boundary="00000000000049da230590c5b784"

--00000000000049da230590c5b784
Content-Type: text/plain; charset="UTF-8"

On Mon, 5 Aug 2019 at 18:39, chris.laplante@agilent.com <
chris.laplante@agilent.com> wrote:

> > But I would like something smarter, e.g. first trying to check if the
> SRC_URI is available, if not switching on using the prebuilt package if
> available (e.g.
> > in a DIR_PREBUILT)...
> >
> > Before going further is there already an existing solution for that? do
> you have any recommendation on the easier/best way to
> > achieve this?
>
> I don't have a "best practice" recommendation to offer. But coincidentally
> I suggested something similar for upstreaming a few weeks ago. It was
> (rightfully) rejected as too "hacky" for inclusion in core code.
> Regardless, here's a bbclass we currently use:
>
> addhandler skip_eventhandler
> python skip_eventhandler() {
>     try:
>         bb.fetch2.Fetch(d.getVar("SRC_URI").split(), d)
>     except bb.fetch2.FetchError:
>         raise bb.parse.SkipRecipe("skip-inaccessible: could not access
> upstream repo; check SRC_URI, access rights, and network availability")
> }
> skip_eventhandler[eventmask] = "bb.event.RecipePreFinalise"
>
>
> As was pointed out to me, this is a pretty heavy-handed approach - it can
> fail for any number of reasons, not just the URI actually being
> unavailable. So you may consider a more surgical check, e.g. actually
> trying to fetch the SRC_URI directly using raw GET requests.
>
> To implement the handover, you'd have separate recipes for the
> build-from-source and the prebuilt case which PROVIDE the same package. You
> probably also want to set PREFERRED_PROVIDER in your layer conf to prefer
> the build-from-source recipe.
>
> Alternatively, you can do it all in a single recipe by rewriting the
> SRC_URI from within the event handler. But I think separate recipes is
> nicer.
>

Well, I ended up with the attached class, which generates or install
prebuilt tarball. It's only a draft and I'll come back with a polished
version, but the idea is to look for the related prebuilt package into a
'PREBUILT_SRC_DIR' (if defined) and install it instead of fetching and
compiling from source. This allows having only one recipe. Then a company
just needs to provide closed-source software as a set of prebuilt tarballs
and customer need to point to the prebuilt dir (e.g. in local.conf).

Regards,
Loic

--00000000000049da230590c5b784
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"g=
mail_attr">On Mon, 5 Aug 2019 at 18:39, <a href=3D"mailto:chris.laplante@ag=
ilent.com">chris.laplante@agilent.com</a> &lt;<a href=3D"mailto:chris.lapla=
nte@agilent.com">chris.laplante@agilent.com</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">&gt; But I would like something =
smarter, e.g. first trying to check if the SRC_URI is available, if not swi=
tching on using the prebuilt package if available (e.g.<br>&gt; in a DIR_PR=
EBUILT)...<br>&gt; <br>&gt; Before going further is there already an existi=
ng solution for that? do you have any recommendation on the easier/best way=
 to<br>&gt; achieve this?<br>
<br>I don&#39;t have a &quot;best practice&quot; recommendation to offer. B=
ut coincidentally I suggested something similar for upstreaming a few weeks=
 ago. It was (rightfully) rejected as too &quot;hacky&quot; for inclusion i=
n core code. Regardless, here&#39;s a bbclass we currently use:<br>
<br>addhandler skip_eventhandler<br>python skip_eventhandler() {<br>=C2=A0 =
=C2=A0 try:<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.fetch2.Fetch(d.getVar(&quot;S=
RC_URI&quot;).split(), d)<br>=C2=A0 =C2=A0 except bb.fetch2.FetchError:<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 raise bb.parse.SkipRecipe(&quot;skip-inaccessib=
le: could not access upstream repo; check SRC_URI, access rights, and netwo=
rk availability&quot;)<br>}<br>skip_eventhandler[eventmask] =3D &quot;bb.ev=
ent.RecipePreFinalise&quot;<br>
<br>
<br>As was pointed out to me, this is a pretty heavy-handed approach - it c=
an fail for any number of reasons, not just the URI actually being unavaila=
ble. So you may consider a more surgical check, e.g. actually trying to fet=
ch the SRC_URI directly using raw GET requests.<br>
<br>To implement the handover, you&#39;d have separate recipes for the buil=
d-from-source and the prebuilt case which PROVIDE the same package. You pro=
bably also want to set PREFERRED_PROVIDER in your layer conf to prefer the =
build-from-source recipe. <br>
<br>Alternatively, you can do it all in a single recipe by rewriting the SR=
C_URI from within the event handler. But I think separate recipes is nicer.=
<br></blockquote><div><br></div><div>Well, I ended up with the attached cla=
ss, which generates or install prebuilt tarball. It&#39;s only a draft and =
I&#39;ll come back with a polished version, but the idea is to look for the=
 related prebuilt package into a &#39;PREBUILT_SRC_DIR&#39; (if defined) an=
d install it instead of fetching and compiling from source. This allows hav=
ing only one recipe. Then a company just needs to provide closed-source sof=
tware as a set of prebuilt tarballs and customer need to point to the prebu=
ilt dir (e.g. in local.conf). <br></div><div><br></div><div>Regards,</div><=
div>Loic<br></div></div></div>

--00000000000049da230590c5b784--

--00000000000049da250590c5b786
Content-Type: application/octet-stream; name="prebuilt.bbclass"
Content-Disposition: attachment; filename="prebuilt.bbclass"
Content-Transfer-Encoding: base64
Content-ID: <f_jznwx7600>
X-Attachment-Id: f_jznwx7600

IyBUaGlzIGNsYXNzIGFsbG93cyB0bzoKIyAgICAgLSBHZW5lcmF0ZSBhIHByZWJ1aWx0IHRhcmJh
bGwgb2YgYSBwYWNrYWdlCiMgICAgIC0gVXNlIGEgcHJldmlzb3VseSBnZW5lcmF0ZWQgcHJlYnVp
bHQgdGFyYmFsbCBpbnN0ZWFkIG9mCiMgICAgICAgZmV0Y2hpbmcgYW5kIGNvbXBpbGluZyBmcm9t
IHNvdXJjZSwgd2hlbiBQUkVCVUlMVF9TUkNfRElSCiMgICAgICAgaXMgZGVmaW5lZC4KIwojIEEg
cGFja2FnZSBoYXMgdG8gaW5oZXJpdHMgJ3ByZWJ1aWx0JyB0byBnZW5lcmF0ZSBhIHByZWJ1aWx0
IHRhcmJhbGwuCiMgQWRkIFBSRUJVSUxUX1NUUklQID0gIjEiIHRvIGdlbmVyYXRlIHN0cmlwcGVk
IHByZWJ1aWx0IChkZWZhdWx0IGlzIDApLgojIFRvIHVzZSBwcmVidWlsdCwgZGVmaW5lIFBSRUJV
SUxUX1NSQ19ESVIgKGUuZy4gaW4gY29uZi9sb2NhbC5jb25mKToKIyAgICAgUFJFQlVJTFRfU1JD
X0RJUiA9ICIvaG9tZS92ZW5kb3IvcHJlYnVpbHRzIgojCiMgVE9ETyBMaWNlbnNlIG1hbmFnZW1l
bnQKCiMgQW5vbnltb3VzIGZ1bmN0aW9uIG5lZWRzIHRvIGJlIGV4ZWN1dGVkIGVhY2ggdGltZSBz
byB0aGF0IHJ1bnF1ZXVlCiMgY2FuIGJlIHVwZGF0ZWQKQkJfRE9OVF9DQUNIRSA9ICIxIgoKREVQ
TE9ZX0RJUl9QUkVCVUlMVCA/PSAiJHtERVBMT1lfRElSfS9wcmVidWlsdHMiCgpQUkVCVUlMVF9E
SVI9IiR7V09SS0RJUn0vcHJlYnVpbHQiClBSRUJVSUxUX0JBU0VOQU1FPSIke1BOfV8ke1BWfV9w
cmVidWlsdF8ke1BBQ0tBR0VfQVJDSH0udGFyLmd6IgpQUkVCVUlMVF9EU1Q9IiR7UFJFQlVJTFRf
RElSfS8ke1BSRUJVSUxUX0JBU0VOQU1FfSIKUFJFQlVJTFRfU1JDPSIke1BSRUJVSUxUX1NSQ19E
SVJ9LyR7UFJFQlVJTFRfQkFTRU5BTUV9IgoKUFJFQlVJTFRfU1RSSVAgPz0gIjAiCgojIEluc3Rh
bGwgUHJlYnVpbHQgdGFyYmFsbApkb19pbnN0YWxsX3ByZWJ1aWx0W2RpcnNdID0gIiR7RH0iCmRv
X2luc3RhbGxfcHJlYnVpbHRbZG9jXSA9ICJQb3B1bGF0ZSBEZXN0aW5hdGlvbiBkaXJlY3Rvcnkg
d2l0aCBwcmVidWlsdCB0YXJiYWxsIGNvbnRlbnQiCgpmYWtlcm9vdCBkb19pbnN0YWxsX3ByZWJ1
aWx0KCkgewogICAgdGFyIC14dnpmICR7UFJFQlVJTFRfU1JDfSAtQyAke0R9Cn0KCiMgR2VuZXJh
dGUgUHJlYnVpbHQgdGFyYmFsbApERVBMT1lfRElSX1BSRUJVSUxUID0gIiR7REVQTE9ZX0RJUn0v
cHJlYnVpbHRzIgpTU1RBVEVUQVNLUyArPSAiZG9fZ2VuZXJhdGVfcHJlYnVpbHQiCmRvX2dlbmVy
YXRlX3ByZWJ1aWx0W2RpcnNdID0gIiR7RH0iCmRvX2dlbmVyYXRlX3ByZWJ1aWx0W2NsZWFuZGly
c10gPSAiJHtQUkVCVUlMVF9ESVJ9Igpkb19nZW5lcmF0ZV9wcmVidWlsdFtzc3RhdGUtaW5wdXRk
aXJzXSA9ICIke1BSRUJVSUxUX0RJUn0iCmRvX2dlbmVyYXRlX3ByZWJ1aWx0W3NzdGF0ZS1vdXRw
dXRkaXJzXSA9ICIke0RFUExPWV9ESVJfUFJFQlVJTFR9Igpkb19nZW5lcmF0ZV9wcmVidWlsdFtz
dGFtcC1leHRyYS1pbmZvXSA9ICIke01BQ0hJTkVfQVJDSH0iCmRvX2dlbmVyYXRlX3ByZWJ1aWx0
W2RvY10gPSAiQ3JlYXRlIGEgdGFyYmFsbCBvZiBwcmVwb3B1bGF0ZWQgRGVzdGluYXRpb24gZGly
ZWN0b3J5IgoKZG9fZ2VuZXJhdGVfcHJlYnVpbHQoKSB7CiAgICBjcCAtYVByICR7RH0gJHtQUkVC
VUlMVF9ESVJ9LyR7UE59CgogICAgaWYgWyAke1BSRUJVSUxUX1NUUklQfSA9ICIxIiBdOyB0aGVu
CiAgICAgICAgIyBUT0RPIGZpbmUgZ3JhaW5lZCBjYWxsIHRvIHN0cmlwCiAgICAgICAgZmluZCAk
e1BSRUJVSUxUX0RJUn0vJHtQTn0gLXR5cGUgZiAtZXhlYyAke1NUUklQfSB7fSArIHx8IHRydWUK
ICAgIGZpCgogICAgdGFyIC0tcmVtb3ZlLWZpbGVzIC0tb3duZXIgMCAtLWdyb3VwIDAgLWN6dmYg
JHtQUkVCVUlMVF9EU1R9IC1DICR7UFJFQlVJTFRfRElSfS8ke1BOfSAuIHx8IFsgJD8gLWVxIDEg
XQp9CgpweXRob24gZG9fZ2VuZXJhdGVfcHJlYnVpbHRfc2V0c2NlbmUoKSB7CiAgICBzc3RhdGVf
c2V0c2NlbmUoZCkKfQoKIyBJbiBjYXNlIG9mIHByZWJ1aWx0IHVzYWdlLCB0aGVzZSB0YXNrcyBh
cmUgZGlzY2FyZGVkClBSRUJVSUxUX0JZUEFTU19UQVNLUyArPSAiXAogICAgZG9fZmV0Y2ggXAog
ICAgZG9fdW5wYWNrIFwKICAgIGRvX3BhdGNoIFwKICAgIGRvX2NvbmZpZ3VyZSBcCiAgICBkb19j
b21waWxlIFwKICAgIGRvX2luc3RhbGwgXAogICAgZG9fcG9wdWxhdGVfbGljIFwKIgoKcHl0aG9u
ICgpIHsKICAgIGlmIGQuZ2V0VmFyKCdQUkVCVUlMVF9TUkNfRElSJykgYW5kIG9zLnBhdGguaXNm
aWxlKGQuZ2V0VmFyKCdQUkVCVUlMVF9TUkMnKSk6CiAgICAgICAgIyB1c2UgcHJlYnVpbHQgcGFj
a2FnZQogICAgICAgIGZvciB0YXNrIGluIGQuZ2V0VmFyKCdQUkVCVUlMVF9CWVBBU1NfVEFTS1Mn
KS5zcGxpdCgpOgogICAgICAgICAgICBkLnNldFZhckZsYWcodGFzaywgJ25vZXhlYycsICcxJykK
ICAgICAgICBiYi5idWlsZC5hZGR0YXNrKCdkb19pbnN0YWxsX3ByZWJ1aWx0JywgJ2RvX3BvcHVs
YXRlX3N5c3Jvb3QnLCAnZG9faW5zdGFsbCcsIGQpCiAgICBlbGlmIGQuZ2V0VmFyKCdERVBMT1lf
RElSX1BSRUJVSUxUJyk6CiAgICAgICAgIyBnZW5lcmF0ZSBwcmVidWlsdCBwYWNrYWdlCiAgICAg
ICAgYmIuYnVpbGQuYWRkdGFzaygnZG9fZ2VuZXJhdGVfcHJlYnVpbHQnLCAnZG9fcm1fd29yaycs
ICdkb19pbnN0YWxsJywgZCkKICAgICAgICBiYi5idWlsZC5hZGR0YXNrKCdkb19nZW5lcmF0ZV9w
cmVidWlsdF9zZXRzY2VuZScsIE5vbmUsIE5vbmUsIGQpCn0KCg==

--00000000000049da250590c5b786--
