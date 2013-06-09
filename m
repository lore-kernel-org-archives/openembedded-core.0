Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by mail.openembedded.org (Postfix) with ESMTP id 70140621CA
	for <openembedded-core@lists.openembedded.org>;
	Sun,  9 Jun 2013 12:03:32 +0000 (UTC)
Received: by mail-oa0-f51.google.com with SMTP id i4so717015oah.38
	for <openembedded-core@lists.openembedded.org>;
	Sun, 09 Jun 2013 05:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=FrfjAtYvj3hOaUJrye5AR3aMqaxXWr7iyuB08q3Y2KI=;
	b=QJOi2pQ6oGGObbyya53Sr0ljscBjbQ4xQiJ+meA05IWyeby2MbP+F6GtTOAs0+F2bi
	dYNOdl2vbTrJvpHR/sMYMm/SsGiZHh/V+jsW0Ov3PJA3QcZNCl+xlp6cU01zHQh2rCGU
	sJ3hMlVceBs+zi7FCx9574FNxHC/ZeQq/grxlxkbUz7Nh9s9Md8gOp19Fq0V8Wn/V1DI
	1yCcyjWvXYcIokJC6MBCW9qstnjd7cS1MeVsFVZ5ZJp1N5h6nqwGlKsnbWZQ1K7tL6XK
	OMdd+7ZgGFFGd1RBKVgaCdj8BQP1YVezoSMg3fId3iola55o2//8kv37QZT8xlRHvg1F
	YMRw==
MIME-Version: 1.0
X-Received: by 10.60.56.131 with SMTP id a3mr4525337oeq.102.1370779413204;
	Sun, 09 Jun 2013 05:03:33 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.108.167 with HTTP; Sun, 9 Jun 2013 05:03:32 -0700 (PDT)
In-Reply-To: <51B292AB.6040602@windriver.com>
References: <cover.1370585547.git.Qi.Chen@windriver.com>
	<4caf51c1d2225dc66aeef8326ba0616d97f7c691.1370585547.git.Qi.Chen@windriver.com>
	<CAP9ODKoSeooN+tpqVEvB5uEE2U7yyt5O1Jy1LZcPpyOYb7FV8A@mail.gmail.com>
	<51B292AB.6040602@windriver.com>
Date: Sun, 9 Jun 2013 09:03:33 -0300
X-Google-Sender-Auth: RIeppQO5KTZkYT1kAPg468En3oc
Message-ID: <CAP9ODKpF8ahQNjnf0JPBGgYPDL1-PSLxGOtMmHY0MjoC5ennbg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: ChenQi <Qi.Chen@windriver.com>
Cc: qingtao.cao@windriver.com, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/8] busybox: remove the postinst part of the recipe
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
X-List-Received-Date: Sun, 09 Jun 2013 12:03:32 -0000
Content-Type: multipart/alternative; boundary=089e01536982fda70804deb7737d

--089e01536982fda70804deb7737d
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Jun 7, 2013 at 11:10 PM, ChenQi <Qi.Chen@windriver.com> wrote:

>  On 06/07/2013 08:32 PM, Otavio Salvador wrote:
>
>
>
>
> On Fri, Jun 7, 2013 at 3:13 AM, <Qi.Chen@windriver.com> wrote:
>
>> From: Chen Qi <Qi.Chen@windriver.com>
>>
>> Remove the pkg_postinst_${PN} from this recipe, as it's redundant.
>> It basically wants to do the same thing as the update-alternatives
>> does. But it doesn't do it well.
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>>
>
>  Instead of removing it, please convert it here for update-alternatives
> so it keeps working on this commit and allow bisect in future if need.
>
>   Hi Otavio,
>
> Thanks for your review and comments.
> Sorry but I don't understand it :(
> What do you mean by "convert it for update-alternatives"?
> Could you please give me a little more explanation?
>

Yes, add the update-alternatives support here as well so we can remove the
postinst and add the  new code in same patch; it allows for bisect :)

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://projetos.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

--089e01536982fda70804deb7737d
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Fri, Jun 7, 2013 at 11:10 PM, ChenQi <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:Qi.Chen@windriver.com" target=3D"_blank">Qi.Chen@windriver.com=
</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
 =20
   =20
 =20
  <div text=3D"#000000" bgcolor=3D"#FFFFFF"><div class=3D"im">
    <div>On 06/07/2013 08:32 PM, Otavio Salvador
      wrote:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <div dir=3D"ltr"><br>
        <div class=3D"gmail_extra"><br>
          <br>
          <div class=3D"gmail_quote">On Fri, Jun 7, 2013 at 3:13 AM, <span =
dir=3D"ltr">&lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=3D"_blank">=
Qi.Chen@windriver.com</a>&gt;</span>
            wrote:<br>
            <blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">From:
              Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=
=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
              <br>
              Remove the pkg_postinst_${PN} from this recipe, as it&#39;s
              redundant.<br>
              It basically wants to do the same thing as the
              update-alternatives<br>
              does. But it doesn&#39;t do it well.<br>
              <br>
              Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windrive=
r.com" target=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
            </blockquote>
            <div><br>
            </div>
            <div>Instead of removing it, please convert it here
              for update-alternatives so it keeps working on this commit
              and allow bisect in future if need.=A0</div>
          </div>
          <div><br>
          </div>
        </div>
      </div>
    </blockquote></div>
    Hi Otavio,<br>
    <br>
    Thanks for your review and comments. <br>
    Sorry but I don&#39;t understand it :(<br>
    What do you mean by &quot;convert it for update-alternatives&quot;?<br>
    Could you please give me a little more explanation?<br></div></blockquo=
te></div><div class=3D"gmail_extra"><br></div>Yes, add the update-alternati=
ves support here as well so we can remove the postinst and add the =A0new c=
ode in same patch; it allows for bisect :)<br clear=3D"all">
<div><br></div>-- <br>Otavio Salvador =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 O.S. Systems<br><a href=3D"http://www.ossystems.com.br"=
 target=3D"_blank">http://www.ossystems.com.br</a> =A0 =A0 =A0 =A0<a href=
=3D"http://projetos.ossystems.com.br" target=3D"_blank">http://projetos.oss=
ystems.com.br</a><br>
Mobile: +55 (53) 9981-7854 =A0 =A0 =A0 =A0 =A0 =A0Mobile: +1 (347) 903-9750=
<br>
</div></div>

--089e01536982fda70804deb7737d--
