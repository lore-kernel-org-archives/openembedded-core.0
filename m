Return-Path: <mhalstead@linuxfoundation.org>
Received: from mail-pg0-f50.google.com (mail-pg0-f50.google.com [74.125.83.50])
	by mail.openembedded.org (Postfix) with ESMTP id 1F859783F2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Aug 2017 05:38:54 +0000 (UTC)
Received: by mail-pg0-f50.google.com with SMTP id v189so43957pgd.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Aug 2017 22:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-language;
	bh=32E320iBZ6cjlfh7Xk10vH/KuizSr1A0lCqYHlyuNYg=;
	b=d+3IuKI+EhPyiKBr+6ArF9KPEQr/ZWdK7FoscrmurI3+y3RotYvh0GbIyqF1T10S09
	GJBIuvjrf+96ivXCrc3jt8PPJ7aEJWdabuj8dtXAvRCW+BA+yDgHlXbTJyxE5Jva+A69
	V5kx+wRxOKhLQ0A00CnRLoUejSkSq5u/lueTk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language;
	bh=32E320iBZ6cjlfh7Xk10vH/KuizSr1A0lCqYHlyuNYg=;
	b=TSQKLu5n4OlOuP5g3jr7Qhgvvw7RmRfcGTT0eqTWV0JNxLsSIYhZWONGGZXX50UWCl
	Oixdc5QqTddOowGbt4U+zgmsbTSXxSwYoKY4deY9x9yFLTT3GT41LXhSOFdx8jDFJEEF
	E0xJP2MsMfvM1fxwnclgVrP0M9kPdpJTrJrPFcDaunHiMJBshY+7Gnt5YLnaqO5Zm5ov
	0YhI0W4RzCdGpiYutY9UXbno8EwbTCnV62dJr/1Mqx2ls5CTw+h0gFYC1wj+6ivPJpqa
	FHIw4p0xknVCQMUO6zVjhkBtjMHMEVr9PAkau2lgcs/j7tnUr0Y61p34J6xnFh8SHICy
	TLzg==
X-Gm-Message-State: AHYfb5g6rvRgKQP+2EOM9qWmZwvXcw1TNJHfekT/mL5in5wQu3y9ed9U
	iYRorrt2odic3tofduuarQ==
X-Received: by 10.84.168.5 with SMTP id e5mr31308065plb.468.1502775535793;
	Mon, 14 Aug 2017 22:38:55 -0700 (PDT)
Received: from yct-lpt.lan (50-39-170-83.bvtn.or.frontiernet.net.
	[50.39.170.83]) by smtp.gmail.com with ESMTPSA id
	l16sm17836864pfk.173.2017.08.14.22.38.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 Aug 2017 22:38:54 -0700 (PDT)
To: Martin Jansa <martin.jansa@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <CA+chaQfG+GnAii57UEpXO_MTi4JYBeAGtMLMY_cXk6qmNcTE-Q@mail.gmail.com>
From: Michael Halstead <mhalstead@linuxfoundation.org>
Organization: Linux Foundation
Message-ID: <469684e6-b272-fa24-801c-ae954da518ae@linuxfoundation.org>
Date: Mon, 14 Aug 2017 22:38:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CA+chaQfG+GnAii57UEpXO_MTi4JYBeAGtMLMY_cXk6qmNcTE-Q@mail.gmail.com>
Subject: Re: errors.yoctoproject.org refusing connections?
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
X-List-Received-Date: Tue, 15 Aug 2017 05:38:55 -0000
Content-Type: multipart/alternative;
	boundary="------------19884ED0276D6B282674C39F"
Content-Language: en-US

--------------19884ED0276D6B282674C39F
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 08/14/2017 04:12 AM, Martin Jansa wrote:
> Hi,
> recently couple uploads to errors.yoctoproject.org <http://errors.yoctoproject.org> end with "Connection reset by peer":
> NOTE: Uploading the report /home/jenkins/oe/world/shr-core/tmp-glibc/log/error-report/error_report_20170813141910.txt to errors.yoctoproject.org:80 <http://errors.yoctoproject.org:80>
> WARNING: Server connection failed [Errno 104] Connection reset by peer
> NOTE: Build completion summary:
> is there some issue on the server or just regular maintenance/upgrades of the application which I just happen to hit quite often? I wasn't seeing so many errors until recently (last month or so).
> Regards,

The filesystem was near capacity causing some new uploads to fail. I've
made more room right now. I'll plan to move to newer hardware in the
future which should help with other issues.

-- 
Michael Halstead
Linux Foundation / SysAdmin


--------------19884ED0276D6B282674C39F
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    On 08/14/2017 04:12 AM, Martin Jansa wrote:<br>
    <blockquote type="cite"
cite="mid:CA+chaQfG+GnAii57UEpXO_MTi4JYBeAGtMLMY_cXk6qmNcTE-Q@mail.gmail.com">
      <div dir="ltr">
        <pre class="gmail-console-output" style="box-sizing:border-box;white-space:pre-wrap;word-wrap:break-word;margin-top:0px;margin-bottom:0px;color:rgb(51,51,51);font-size:14px">Hi,</pre>
        <pre class="gmail-console-output" style="box-sizing:border-box;white-space:pre-wrap;word-wrap:break-word;margin-top:0px;margin-bottom:0px;color:rgb(51,51,51);font-size:14px">
</pre>
        <pre class="gmail-console-output" style="box-sizing:border-box;white-space:pre-wrap;word-wrap:break-word;margin-top:0px;margin-bottom:0px;color:rgb(51,51,51);font-size:14px">recently couple uploads to <a href="http://errors.yoctoproject.org" moz-do-not-send="true">errors.yoctoproject.org</a> end with "Connection reset by peer":</pre>
        <pre class="gmail-console-output" style="box-sizing:border-box;white-space:pre-wrap;word-wrap:break-word;margin-top:0px;margin-bottom:0px;color:rgb(51,51,51);font-size:14px">
</pre>
        <pre class="gmail-console-output" style="box-sizing:border-box;white-space:pre-wrap;word-wrap:break-word;margin-top:0px;margin-bottom:0px;color:rgb(51,51,51);font-size:14px">NOTE: Uploading the report /home/jenkins/oe/world/shr-core/tmp-glibc/log/error-report/error_report_20170813141910.txt to <a href="http://errors.yoctoproject.org:80" moz-do-not-send="true">errors.yoctoproject.org:80</a>
</pre>
        <pre class="gmail-console-output" style="box-sizing:border-box;white-space:pre-wrap;word-wrap:break-word;margin-top:0px;margin-bottom:0px;color:rgb(51,51,51);font-size:14px">WARNING: Server connection failed [Errno 104] Connection reset by peer
NOTE: Build completion summary:</pre>
        <pre class="gmail-console-output" style="box-sizing:border-box;white-space:pre-wrap;word-wrap:break-word;margin-top:0px;margin-bottom:0px;color:rgb(51,51,51);font-size:14px">
</pre>
        <pre class="gmail-console-output" style="box-sizing:border-box;white-space:pre-wrap;word-wrap:break-word;margin-top:0px;margin-bottom:0px;color:rgb(51,51,51);font-size:14px">is there some issue on the server or just regular maintenance/upgrades of the application which I just happen to hit quite often? I wasn't seeing so many errors until recently (last month or so).</pre>
        <pre class="gmail-console-output" style="box-sizing:border-box;white-space:pre-wrap;word-wrap:break-word;margin-top:0px;margin-bottom:0px;color:rgb(51,51,51);font-size:14px">
</pre>
        <pre class="gmail-console-output" style="box-sizing:border-box;white-space:pre-wrap;word-wrap:break-word;margin-top:0px;margin-bottom:0px;color:rgb(51,51,51);font-size:14px">Regards,</pre>
      </div>
    </blockquote>
    <br>
    The filesystem was near capacity causing some new uploads to fail.
    I've made more room right now. I'll plan to move to newer hardware
    in the future which should help with other issues.<br>
    <pre class="moz-signature" cols="72">-- 
Michael Halstead
Linux Foundation / SysAdmin
</pre>
  </body>
</html>

--------------19884ED0276D6B282674C39F--
