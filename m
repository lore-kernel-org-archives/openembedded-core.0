Return-Path: <jpuhlman@mvista.com>
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com
	[209.85.167.169])
	by mail.openembedded.org (Postfix) with ESMTP id 436AF6112B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2020 20:08:02 +0000 (UTC)
Received: by mail-oi1-f169.google.com with SMTP id z2so10590187oih.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2020 12:08:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language;
	bh=+1oMdDxqJE1D9SOC4u8yorblZKi7y+NUXGFhtsCnehk=;
	b=H2T1N64q0ddccXwSbl+EXfwscUzmqzcsfoVHiptnBD9eaB2CqLj+cHXW4d8id3rLgN
	76iFa4z94sfCDnE3B8Q0maT417MtPXxxO1qullv/Tt9VWcdMD/yTULoKUUDXNxJ8kSm0
	+acxN6+14hc8Tt9c7B3C1h6h766R0juyf700lPt9PNZhAgcPLaVvqdip1R8afIXIB1zT
	1mXLrHtWdQhr6LyGSSEK0rRjkw07qlkJIJT4OZ0u6/amb9RCSJ35Smm5h554vTIWu+aH
	QRdajzKhThfZyJv/B3qL1AX+zkIFramW11/E5iQxjHgFzvt0tsUZFqEk8v4Q4wizDayq
	3iFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language;
	bh=+1oMdDxqJE1D9SOC4u8yorblZKi7y+NUXGFhtsCnehk=;
	b=GSQUyL6pSx5lZvOSmZk8J4P+sruHt90YHMffHBO3QUR3V1iiUBwAlv9ys44RZTZ6+v
	6LEOs1PQ2Ok7+dlZTSMvEliPN7GUgU6/FKv1v/k+/2G0BB3M+Bwo/B6/KTN7rw0+NOuq
	6Rq/6J2H5TCcejjjhfIgDZhoJZm/mBURwlUfVwHJ0N3AFHZxqsxpA+Vyeww7qDiNITo0
	/glFju1WTlNkh/JuqTJbTTjw0bma5nWkL7TGMMAjjFtfkQSKxH4V/55QPCNf/SNviXNl
	v4R1VIZ5bKXxsud6eVcxmeTHljqUJLbycBRE5Cn5wwT1YsjbDUAcYpNftIdDUaeXRVKT
	881g==
X-Gm-Message-State: APjAAAXr3q1nosGJuYVrUXmYZZFW5khSglfZf0ywK1nXPThMa9/ub/Lp
	bfFCEpHBvJozB85whJRtZuRK/Vu+97k=
X-Google-Smtp-Source: APXvYqyKgtk24TyeP9tTuuTVEb9JWV8t6NuNr6lANV1VOSJB7/y0CJT/YMjlm3FBDEANpg72WvJO4Q==
X-Received: by 2002:aca:aa05:: with SMTP id t5mr3033260oie.93.1581710882751;
	Fri, 14 Feb 2020 12:08:02 -0800 (PST)
Received: from ?IPv6:2600:1700:4c90:60a0:f530:568a:42ef:6fa?
	([2600:1700:4c90:60a0:f530:568a:42ef:6fa])
	by smtp.gmail.com with ESMTPSA id x21sm2309600oto.5.2020.02.14.12.08.01
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Fri, 14 Feb 2020 12:08:02 -0800 (PST)
To: Andrew Boos <andrew@avilution.com>
References: <CAGgh2e88CwQZjrosOkZ4Jdd4nK2V=YC3+e65eRmLrqdUSPC73Q@mail.gmail.com>
	<1b01b37f-ba3b-da34-8e04-81e3f2dd72fb@mvista.com>
	<CAGgh2e_TzXNQejWMog37ad7kf-ruSiRw-rvCC_NpOF-PjMbUhg@mail.gmail.com>
From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
Message-ID: <21c80513-3588-3f62-4ee1-55dd5cb58759@mvista.com>
Date: Fri, 14 Feb 2020 12:07:38 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAGgh2e_TzXNQejWMog37ad7kf-ruSiRw-rvCC_NpOF-PjMbUhg@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Unknown Postinstall Scriptlet Failing to Defer Boot
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
X-List-Received-Date: Fri, 14 Feb 2020 20:08:02 -0000
Content-Type: multipart/alternative;
	boundary="------------4E8E87D4E547580C36170141"
Content-Language: en-US

--------------4E8E87D4E547580C36170141
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

If you look at the log.do_rootfs it will give you more or less the exact 
failure(using the message below as a guide), the error message below is 
basically
the final catchall that says "at least one of them failed, please go fix 
it" kind of message.

On 2/14/2020 10:30 AM, Andrew Boos wrote:
> Thanks Jeremy for the hint about update-alternatives. It turns out 
> that lmbench was installing a binary called "stream" that conflicts 
> with ImageMagick's own stream. All we had to do was remove lmbench 
> from our IMAGE_INSTALL and the problem went away. I'm posting the 
> original error for anyone that is having the same issue.
>
> ERROR: imx8-image-3.0b3-r0 do_rootfs: Postinstall scriptlets of 
> ['imagemagick'] have failed. If the intention is to defer them to 
> first boot,
> then please place them into pkg_postinst_ontarget_${PN} ().
> Deferring to first boot via 'exit 1' is no longer supported.
>
> Andrew
>
>
> On Thu, Feb 13, 2020 at 8:02 PM Jeremy A. Puhlman <jpuhlman@mvista.com 
> <mailto:jpuhlman@mvista.com>> wrote:
>
>     In these kind of cases, by providing the actual error message,
>     people can provide more help.
>
>     The recipe inherits update-alternatives and sets a large number of
>     alternatives. The alternatives are done in the automatically added
>     post install scripts. In all likelihood one of the listed links is
>     wrong, or already a symlink or something similar.
>     On 2/13/2020 4:49 PM, Andrew Boos wrote:
>>     Hi,
>>
>>     I am working on a bitbake build and I am running into an issue
>>     where a postinst scriptlet is failing via "exit 1" to defer to
>>     first boot and I cannot figure out which recipe is causing the
>>     issue. Does anybody have any tips on identifying which recipe is
>>     actually exiting with a failure? The error log says that it is in
>>     imagemagick but the recipe does not have any postinst scripts
>>     defined. Also, there are no imagemagick .bbappend files in my
>>     layers.
>>     (https://github.com/openembedded/meta-openembedded/blob/sumo/meta-oe/recipes-support/imagemagick/imagemagick_7.0.7.bb)
>>
>>     Thanks,
>>     Andrew
>>
>>     <http://www.avg.com/email-signature?utm_medium=email&utm_source=link&utm_campaign=sig-email&utm_content=emailclient>
>>     	Virus-free. www.avg.com
>>     <http://www.avg.com/email-signature?utm_medium=email&utm_source=link&utm_campaign=sig-email&utm_content=emailclient>
>>
>>
>>     <#m_-7702559278781328841_DAB4FAD8-2DD7-40BB-A1B8-4E2AA1F9FDF2>
>>
>
>     -- 
>     Jeremy A. Puhlman
>     jpuhlman@mvista.com  <mailto:jpuhlman@mvista.com>
>
>
>
> -- 
> *Andrew Boos* | Avilution, LLC
> (c) 251-895-5509

-- 
Jeremy A. Puhlman
jpuhlman@mvista.com


--------------4E8E87D4E547580C36170141
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    If you look at the log.do_rootfs it will give you more or less the
    exact failure(using the message below as a guide), the error message
    below is basically<br>
    the final catchall that says "at least one of them failed, please go
    fix it" kind of message.<br>
    <br>
    <div class="moz-cite-prefix">On 2/14/2020 10:30 AM, Andrew Boos
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAGgh2e_TzXNQejWMog37ad7kf-ruSiRw-rvCC_NpOF-PjMbUhg@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">Thanks Jeremy for the hint about
        update-alternatives. It turns out that lmbench was installing a
        binary called "stream" that conflicts with ImageMagick's own
        stream. All we had to do was remove lmbench from our
        IMAGE_INSTALL and the problem went away. I'm posting the
        original error for anyone that is having the same issue.
        <div><br>
        </div>
        <div>ERROR: imx8-image-3.0b3-r0 do_rootfs: Postinstall
          scriptlets of ['imagemagick'] have failed. If the intention is
          to defer them to first boot,<br>
          then please place them into pkg_postinst_ontarget_${PN} ().<br>
          Deferring to first boot via 'exit 1' is no longer supported.<br>
        </div>
        <div><br>
        </div>
        <div>Andrew</div>
        <div><br>
        </div>
      </div>
      <br>
      <div class="gmail_quote">
        <div dir="ltr" class="gmail_attr">On Thu, Feb 13, 2020 at 8:02
          PM Jeremy A. Puhlman &lt;<a href="mailto:jpuhlman@mvista.com"
            moz-do-not-send="true">jpuhlman@mvista.com</a>&gt; wrote:<br>
        </div>
        <blockquote class="gmail_quote" style="margin:0px 0px 0px
          0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
          <div> <font size="+1"><tt>In these kind of cases, by
                providing the actual error message, people can provide
                more help. </tt><tt><br>
              </tt><tt><br>
              </tt><tt>The recipe inherits </tt></font><tt><span style="color:rgb(36,41,46);font-size:12px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;white-space:pre-wrap;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:initial;float:none;display:inline"><font size="+1">update-alternatives and sets a large number of alternatives. The alternatives
are done in the automatically added post install scripts. In all likelihood one of the listed links
is wrong, or already a symlink or something similar.</font>
</span></tt><br>
            <div>On 2/13/2020 4:49 PM, Andrew Boos wrote:<br>
            </div>
            <blockquote type="cite">
              <div dir="auto">
                <div dir="auto">Hi,</div>
                <div dir="auto"><br>
                </div>
                <div dir="auto">I am working on a bitbake build and I am
                  running into an issue where a postinst scriptlet is
                  failing via "exit 1" to defer to first boot and I
                  cannot figure out which recipe is causing the issue.
                  Does anybody have any tips on identifying which recipe
                  is actually exiting with a failure? The error log says
                  that it is in imagemagick but the recipe does not have
                  any postinst scripts defined. Also, there are no
                  imagemagick .bbappend files in my layers. (<a
href="https://github.com/openembedded/meta-openembedded/blob/sumo/meta-oe/recipes-support/imagemagick/imagemagick_7.0.7.bb"
                    target="_blank" moz-do-not-send="true">https://github.com/openembedded/meta-openembedded/blob/sumo/meta-oe/recipes-support/imagemagick/imagemagick_7.0.7.bb</a>)</div>
                <div dir="auto"><br>
                </div>
                <div dir="auto">Thanks,</div>
                <div dir="auto">Andrew</div>
              </div>
              <div
                id="gmail-m_-7702559278781328841DAB4FAD8-2DD7-40BB-A1B8-4E2AA1F9FDF2"><br>
                <table style="border-top:1px solid rgb(211,212,222)">
                  <tbody>
                    <tr>
                      <td style="width:55px;padding-top:13px"><a
href="http://www.avg.com/email-signature?utm_medium=email&amp;utm_source=link&amp;utm_campaign=sig-email&amp;utm_content=emailclient"
                          target="_blank" moz-do-not-send="true"><img
src="https://ipmcdn.avast.com/images/icons/icon-envelope-tick-green-avg-v1.png"
                            alt="" style="width: 46px; height: 29px;"
                            moz-do-not-send="true" width="46"
                            height="29"></a></td>
                      <td
style="width:470px;padding-top:12px;color:rgb(65,66,78);font-size:13px;font-family:Arial,Helvetica,sans-serif;line-height:18px">Virus-free.
                        <a
href="http://www.avg.com/email-signature?utm_medium=email&amp;utm_source=link&amp;utm_campaign=sig-email&amp;utm_content=emailclient"
                          style="color:rgb(68,83,234)" target="_blank"
                          moz-do-not-send="true">www.avg.com</a> </td>
                    </tr>
                  </tbody>
                </table>
                <a
                  href="#m_-7702559278781328841_DAB4FAD8-2DD7-40BB-A1B8-4E2AA1F9FDF2"
                  width="1" height="1" moz-do-not-send="true"> </a></div>
              <br>
              <fieldset></fieldset>
            </blockquote>
            <br>
            <pre cols="72">-- 
Jeremy A. Puhlman
<a href="mailto:jpuhlman@mvista.com" target="_blank" moz-do-not-send="true">jpuhlman@mvista.com</a>
</pre>
          </div>
        </blockquote>
      </div>
      <br clear="all">
      <div><br>
      </div>
      -- <br>
      <div dir="ltr" class="gmail_signature">
        <div dir="ltr">
          <div>
            <div dir="ltr">
              <div
                style="color:rgb(0,0,0);font-family:Verdana;font-size:13.3333px"><strong>Andrew
                  Boos</strong> | Avilution, LLC</div>
              <div
                style="color:rgb(0,0,0);font-family:Verdana;font-size:13.3333px">(c)
                251-895-5509</div>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
    <pre class="moz-signature" cols="72">-- 
Jeremy A. Puhlman
<a class="moz-txt-link-abbreviated" href="mailto:jpuhlman@mvista.com">jpuhlman@mvista.com</a>
</pre>
  </body>
</html>

--------------4E8E87D4E547580C36170141--
