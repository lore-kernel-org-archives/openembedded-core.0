Received: from fhigh-b4-smtp.messagingengine.com (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9627.1793273457841166529
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2026 04:30:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=bI+Nt8tc;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=bLW25LRC;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.155, mailfrom: paul@pbarker.dev)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id E5F027A0157
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 07:30:56 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Thu, 29 Oct 2026 07:30:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1793273456;
	 x=1793359856; bh=+oxuWE7RKszQsxTGksj5zJF0TFwhQ4htNPqC+FianWA=; b=
	bI+Nt8tc+ENLc2jgWy5W6sF+Ubnrz2dETjqH1iHwtAhKJMN2fggG4LvAIdAMj5EK
	0pMcJTTuD14wzZMtiLw7zga/P5Jcu1KIWbBVpS/HARSHbZ1gb+3b81N+j7ZgxadR
	1gybIakJ5Fy1Uj6CYsREajIye/57sBDImVjaQyXPgqLAeMutwlAAtUwsBojidunu
	xf1IfH9UpMrZLujeBT1cLJohKYEmtkmDr5xnfQX4O0r8vl0lCtc2BKSfcAx62JGh
	j2j9z54eEFMaZCVEQwoZKGYTfYEa25rWhBXNCCj/zoVGCeZhCuUOhUNS+5ZEQXV5
	aWRLYw03eEmBulRbCc6BJg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1793273456; x=1793359856; bh=+
	oxuWE7RKszQsxTGksj5zJF0TFwhQ4htNPqC+FianWA=; b=bLW25LRCv7eMetNL2
	uvSCYCoJU2SMHK1Pc+qq1p99a4H5G/QamEkAgzAGOtmwklaKT952Ky8F1g06109B
	0jmJP/sMOX8eicjA8lI4Xe0+WmW5f/gNhcX0kkhexEhztsOS7AvAW76B40dUMCZi
	Y74DaYkf6IP78DuSzghji1Ch2JMoHfNx2g5Bk9BtZvKRQ9ValJRQbo0NVXo7E8BG
	9M/b4/nFoEgdeuKhV25pL1cWpGZuwdVQHfxqMN4o4UwmpwNW1L3xMt0Kj5ZFqm4F
	acswBiiKpRM8OoNoWGa8yI83z/1fp5MCbXVvMgZpqW9eIEvLe6l+7KlH5iNgPWdM
	O3YgA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=pbarker.dev a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793273456; d=pbarker.dev;
	mf=PHBhdWxAcGJhcmtlci5kZXY+;
	rt=PG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+;
	s=fm1:rsa-sha256:d+2GAQT4yxca5AdA5Y9RB4oF47oHwold3M8w0HOTs/uKXUp
	s79LDO1O4LiE7X/PZIDWC6r5ChohM8+MYAryKaIfZ3m7A6XQY2Xg0gzYNLEBfhhW
	y3Ag68aHkmEYlCb7O6E8T+Be/SYviEXEPy2veZ2oZ0SXzpCbyzID4BmNX9zgR56T
	pj8Akow1ChXgvcyRTuFSQhyV9XMUvoK8aX5mAb3bEHeV+avz2GT4xVBiqLGX9bTy
	0MdV4NaZ67iyFmXJbhYxurphdfmdsO3zAJAGas0w9U+86LtNqAUoi+ZQ6Ju+gKj/
	xVEQnlwgm7GbWeWMibxlVjSGMATIfR6j9IzXSgA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=content-transfer-encoding,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to,
	user-agent;
Message-Instance: m=1; h=sha256:sYtcr40sOebBCdib0eNWZxGwt4GU/V97ViwhhirIm0w=:0euRrmWDVAV+M0EK7C0gADRyvINaZUJ1xEHwJBSGOVU=;
X-ME-Sender: <xms:cC7jaqnKQdL6imEoR1qZGNgBXHIkpYYZgiTsxPmqr350FKMfLC7vhw>
    <xme:cC7jan2_dtzLtF-71MLyS_D9aoGflu0Vd5yRrDjQd6Iuf5gRzkOR15TLI7ijcBiW9
    NU_CNIsFxbaQZARaDSPR5q3hewlvYsZzASCBTuHueOqDsmChDa5EgY>
X-ME-Received: <xmr:cC7jamTMHrAsuZwwkVDdSL2gMi9Ja4P1b8ejlHgMh1fjvoimapmtPVdo4LB5FOP891YR25XpjYQEtnMGneDcIaQWP-mtrf0_9Vty79c>
X-ME-Proxy-Cause: dmFkZTGq0sj8AyL+eJOVy+/ZPa4DyvWkdFE2rZSiy5LLKl32o3kYY2rXRS/6JiMbvei8bU
    Il7ameUlk0/jIkNJvLfFSOzIYt2uVZ7eG7+PpSFfbaJX+AsD0Bqw8+mwAxt6CKpFb0esqr
    B3oUAdn6dywENP6es/0ThnQu5C0KZOK/YzQ642+cx+C8BAGC2fbr0uueyoV4sh3oVEcU0O
    hI4odtLlCnYX2Qmd7oHX15IWwS5v7qOXOzX9nrJoZ0kRYWv6yX16/aqoIEYaVcI3oSiWeD
    yVNscGQTn9fEDjojoXeB7djDPJeLK5eWsj5HGu6mtuxsd7j5LCVyDI6qw9Hjnc7DJZeHab
    itZNF3VMXDY2IXdxarwCQixBCZSi7F44lZd/3fqNC9UnOKFNqeRODGj9qBsdHs90+kH4Gs
    juIvQLRbe+FeRlVfgQ/GsCKgt/6IlusPO4/2LRYuFFHEdoFC+AMlEFolCQeDojlwP/LwX3
    1NEAh/uO2Y+EwckwuzoInNG7p3SgVYn8Sx/FqVNtfSeOVdgYqr6hi7cLO57/fC+RgD5s/f
    OsaDfGMij9v9xM44JixWIAX2BHkOp+6400VuqHzqeDwoE8mM8+R0ZdFw0zE/mz9GDkz3yL
    0sVvhYiYXHXjlObdBwhSQPPvNRfR8c4a07s2c6J/oP2Q6brvTqn5d004fQjw
X-ME-Proxy: <xmx:cC7japsnyfS4uOwWDqZOLAyTIuLsVyN3fY4iAyRkrsqV_P-QMrmooA>
    <xmx:cC7jarac5cmILrTgEHwO-STkwNj_aFxmK3u_qsefNoei9JO_uYrh9A>
    <xmx:cC7jauso7yqz8KpH0dTZhEnI7GDi1p9doWquNezxMOIiPzMJKWWm7g>
    <xmx:cC7jatFA0ISHo4x4us1bNj9RoV5_9Lgu578t3EIScr-QrMnsVk4s3g>
    <xmx:cC7jahM4OBRZH92qGZ5rg_v2udmmNHArSqwC1YiBGvgwMoCTTWL5WU3m>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 29 Oct 2026 07:30:55 -0400 (EDT)
Message-ID: <d367c259a241a33364960b8401e25e6e6ad465e8.camel@pbarker.dev>
Subject: Re: [PATCH 2/5] uki.bbclass: use f-string for kernel-not-found
 error message
From: Paul Barker <paul@pbarker.dev>
To: Maxin John <maxin.john@gehealthcare.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 29 Oct 2026 11:30:54 +0000
In-Reply-To: <20261027081221.13-2-maxin.john@gehealthcare.com>
References: <20261027081221.13-1-maxin.john@gehealthcare.com>
	 <20261027081221.13-2-maxin.john@gehealthcare.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 11:30:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248933

On Tue, 2026-10-27 at 10:12 +0200, Maxin John wrote:
> The message was an f-string without placeholders combined with
> '%'-formatting. Use a single f-string referencing the kernel variable.
>=20
> Signed-off-by: Maxin John <maxin.john@gehealthcare.com>
> ---
>  meta/classes-recipe/uki.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/classes-recipe/uki.bbclass b/meta/classes-recipe/uki.bb=
class
> index 566eab1eaa..cfb930e93d 100644
> --- a/meta/classes-recipe/uki.bbclass
> +++ b/meta/classes-recipe/uki.bbclass
> @@ -138,7 +138,7 @@ python do_uki() {
>      if kernel_filename:
>          kernel =3D "%s/%s" % (deploy_dir_image, kernel_filename)
>          if not os.path.exists(kernel):
> -            bb.fatal(f"ERROR: cannot find %s" % (kernel))
> +            bb.fatal(f"ERROR: cannot find {kernel}")

Could we drop the f-string prefix instead? String formatting with '%' is
used more often here.

Best regards,

--=20
Paul Barker

