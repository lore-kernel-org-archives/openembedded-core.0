Received: from mailrelay2-2.pub.mailoutpod1-cph3.one.com (mailrelay2-2.pub.mailoutpod1-cph3.one.com [46.30.212.1])
 by mx.groups.io with SMTP id smtpd.web10.10500.1625596765315731158
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Jul 2021 11:39:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@berginkonsult.se header.s=20191106 header.b=kviDb5sO;
 spf=none, err=permanent DNS error (domain: berginkonsult.se, ip: 46.30.212.1, mailfrom: peter@berginkonsult.se)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=berginkonsult.se; s=20191106;
	h=content-type:in-reply-to:mime-version:date:message-id:from:references:cc:to:
	 subject:from;
	bh=msjW9+bAbb2cXBVhZahgRQyihscq4gRvyRexUUnxGuM=;
	b=kviDb5sOQEZqJ9LuLqeZ2Bk+2dqv4h5cToxRqXL90Ptgjs3c3Af7p03kmSXaqZZ0kelFEkpLlfZe1
	 QR6dp2T04mYv+0kvXc5kTLZhGsDu/jF98VONS9t0d9ZPK57NT4BGVlQBuYmT+5P1rxOfYXKwlEDxwt
	 TrtGHrs3Nug7TKDGWCFyAXvfH1/Y7VhyseGmsAGlROj12OSsx2P+Q1xc5t/bqrBYL1MfxpxJypapLo
	 38uwTMiYn7Skf4brhf7xsHKaX9GiKmyPH3SnUnUdOHAHYoi2QrHOxrNHaGWl+s8/4mZMaDVlRbgsJq
	 hYQjsTnIQ86geEKossEeQND8+oSmM+g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=berginkonsult.se; s=rsa1;
	h=content-type:in-reply-to:mime-version:date:message-id:from:references:cc:to:
	 subject:from;
	bh=msjW9+bAbb2cXBVhZahgRQyihscq4gRvyRexUUnxGuM=;
	b=e7GrIKkl8U3bciSJpHHvIPe2kqyGjc7haigRCcnNwFlOu79ubmzdu+6QpiEqUnQVSxXNfIsnjGEc/
	 7IWEUT7HrqR1HkfYwlzrXyLI9kUQ8obr+RcVRxn6YX3EiNV7DjHc6/wSfo4HnEGbHcmR9DNTuFsIsL
	 CdstB4VwumSO7ziMUurSOcbtszVmSTJjIFxItqnoRI/2nXzsUkbHJ10n6g0kRBMQFPWQIyD5ApN3ds
	 yUaQHwchIeGSkzY3+gbocgz0x9iW5zk7sIYjxozYUbUye9F9LZzgFc3rA12RvAxlOP/ASBq05ISXXO
	 tfuwdl/bLvo0OiR+Zvll0w+hsBroueQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
	d=berginkonsult.se; s=ed1;
	h=content-type:in-reply-to:mime-version:date:message-id:from:references:cc:to:
	 subject:from;
	bh=msjW9+bAbb2cXBVhZahgRQyihscq4gRvyRexUUnxGuM=;
	b=0xGrGcsmlTKbtjesOwFC0wIg16Bt4jBPZJ5mPeBwn/a6cbeOOhUrLzCngmr7jFFGEjzq6g60QZ2XF
	 oVxEoJkAA==
X-HalOne-Cookie: cc8f65e962646fd0fca01682dd07e3e48bbee8cb
X-HalOne-ID: 7b123142-de89-11eb-b56e-d0431ea8a290
Received: from [192.168.100.145] (ua-85-227-233-29.bbcust.telenor.se [85.227.233.29])
	by mailrelay2.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
	id 7b123142-de89-11eb-b56e-d0431ea8a290;
	Tue, 06 Jul 2021 18:39:22 +0000 (UTC)
Subject: Re: [OE-core] [PATCH] Revert "libubootenv: inherit uboot-config"
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Anuj Mittal <anuj.mittal@intel.com>,
 "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
 "otavio@ossystems.com.br" <otavio@ossystems.com.br>,
 "liu.ming50@gmail.com" <liu.ming50@gmail.com>
References: <20210702115900.19417-1-peter@berginkonsult.se>
 <bc5cdd46cfb003f45c1ed7762ee140c0f4f5cca5.camel@intel.com>
 <775af313-1b19-146e-b0f3-113d5af0a992@berginkonsult.se>
 <a3f45eab0d82dea6f34936d821d902b79c43abbd.camel@linuxfoundation.org>
 <0e446811e98bcb4833cdc0c7f5dd40fcd8f07a43.camel@intel.com>
 <d83ff556-cab9-3616-f4ad-506e8675eda5@berginkonsult.se>
 <db03a0b4-d292-4db8-694e-56b3fa1c99cc@berginkonsult.se>
 <CAP9ODKrSEHz26EPkkOvPqpd37x3fzmTTJ9vuPxByFMnraJVmvg@mail.gmail.com>
From: "Peter Bergin" <peter@berginkonsult.se>
Message-ID: <a2041c84-be88-e981-1f7f-3c40da3ca60c@berginkonsult.se>
Date: Tue, 6 Jul 2021 20:39:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAP9ODKrSEHz26EPkkOvPqpd37x3fzmTTJ9vuPxByFMnraJVmvg@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------6223F1729AFCBAAF01655E2A"
Content-Language: en-US

--------------6223F1729AFCBAAF01655E2A
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Otavio,

On 2021-07-06 18:56, Otavio Salvador wrote:
>
>
> Em ter., 6 de jul. de 2021 às 12:12, Peter Bergin 
> <peter@berginkonsult.se <mailto:peter@berginkonsult.se>> escreveu:
>
>     Then I can correct my earlier statement and a new wisdom that
>     run-time
>     dependecies are scanned already in the early phases. Apparently it is
>     not possible to build libubootenv due to RRECOMMENDS to
>     u-boot-default-env. The build for a 'non-u-boot config' will fail
>     if we
>     add 'inherit uboot-config' and it will fail without. What is the
>     difference for a 'world' build?
>
>
> The dependency on the default-env seems too strong. It could be 
> relaxed as it works without it.
>
Do we have a run-time dependency that is 'lesser than' RRECOMMENDS? Or 
do you suggest removing the dependency?

/Peter


--------------6223F1729AFCBAAF01655E2A
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi Otavio,<br>
    </p>
    <div class="moz-cite-prefix">On 2021-07-06 18:56, Otavio Salvador
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAP9ODKrSEHz26EPkkOvPqpd37x3fzmTTJ9vuPxByFMnraJVmvg@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div dir="ltr"><br>
        </div>
        <br>
        <div class="gmail_quote">
          <div dir="ltr" class="gmail_attr">Em ter., 6 de jul. de 2021
            às 12:12, Peter Bergin &lt;<a
              href="mailto:peter@berginkonsult.se"
              moz-do-not-send="true">peter@berginkonsult.se</a>&gt;
            escreveu:<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">Then I can correct my
            earlier statement and a new wisdom that run-time <br>
            dependecies are scanned already in the early phases.
            Apparently it is <br>
            not possible to build libubootenv due to RRECOMMENDS to <br>
            u-boot-default-env. The build for a 'non-u-boot config' will
            fail if we <br>
            add 'inherit uboot-config' and it will fail without. What is
            the <br>
            difference for a 'world' build?<br>
          </blockquote>
          <div><br>
          </div>
          <div>The dependency on the default-env seems too strong. It
            could be relaxed as it works without it. <br>
          </div>
        </div>
      </div>
      <br>
    </blockquote>
    <p>Do we have a run-time dependency that is 'lesser than'
      RRECOMMENDS? Or do you suggest removing the dependency?</p>
    <p>/Peter<br>
    </p>
  </body>
</html>

--------------6223F1729AFCBAAF01655E2A--
