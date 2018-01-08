Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qt0-f181.google.com (mail-qt0-f181.google.com
	[209.85.216.181])
	by mail.openembedded.org (Postfix) with ESMTP id 2FEDA6093F;
	Mon,  8 Jan 2018 23:20:58 +0000 (UTC)
Received: by mail-qt0-f181.google.com with SMTP id u10so15738043qtg.2;
	Mon, 08 Jan 2018 15:21:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+yKHHVb56C/3Rs8UxiKVrwy4rdBx+eByWsjbw+OWQz8=;
	b=Abj4U/t0jzddmNqeNw4leO6udgxwBWpyD4GsTSM1IE9CG7kCryStgXqeEvT+yWwz/r
	MZ+oiBPJk4P7t/gtZArtjHPE/vHIN1Lr19bZk4UDd+yUiEZzXm3ihMsGWCNcApIgXC63
	paap8wwdbyWfY6HKQignG1XVy5vlmZd/FaMqy71lZYEozrhSHzw4N0NDV9p2+bjck0bH
	kbU3/ddxYWiDxlSRhur7CzRFCnl0XgK6HqNwhBgf+f4Ndw2G317g89o/q7ZuvZXZPEg7
	Xj59CiZwwCaPc4nypkf2d+JNC5vn/mvedCvwnWV/EvbXAfMKZfddKwZR0iy5ZEJhgpzm
	6pXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+yKHHVb56C/3Rs8UxiKVrwy4rdBx+eByWsjbw+OWQz8=;
	b=jwTzvUz8GCfi+9QBQ9zq76ifPKM9Jqi4Ab1hmNtgsR+ca+xXHSwF4V9bGlM0PnS057
	mZFztipoSmisFpjR06wRQ3WItB1vPjJQDdHdnj2FG+k5T/w3q6hxN0yHW23tRSo1nxvH
	cpHVyKpx5Xdx0FSL96mjEq6ENKqox9QHZfXnx91KEepQd1y0IO6vzRqxqheZ88+Albrp
	4OMM1NY5OeqcPGofGRWEC3wfWvg0wDFV7ePIZoYOxvlp/hNF85i8lPfoy4aXE1knqZKP
	Z8OKSRbGy8XIFUM5ieoGjzfId4Pz+se2WZizC1RVMkBBcmfYRayox01ZxVZlMc941q7d
	ppRA==
X-Gm-Message-State: AKGB3mJUGWncgaE3qAuauP7INd6qjVvS12NjOAPOCENNIwMlsuDgIlYp
	A7y2Z3D4EUVhTBGrySadhcy9KLDwz4KdPl26Snk=
X-Google-Smtp-Source: ACJfBot2vIRkB+/hKmroyPwD6KM8ZtlNE64w0P79m6oW38+giIjEJHOiMPzOYxtDnJ4CB2qqTMop4xUdR3d7hhWuwxo=
X-Received: by 10.200.14.130 with SMTP id v2mr18908879qti.289.1515453660049;
	Mon, 08 Jan 2018 15:21:00 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.182.96 with HTTP; Mon, 8 Jan 2018 15:20:59 -0800 (PST)
In-Reply-To: <90d7f4e2-5b44-34ad-6403-d843e244299b@gmail.com>
References: <161986bc-e04c-3cdd-c744-5cebff1d4fb7@gmail.com>
	<CADkTA4M_b8e3d3bRCE+jY44F_atCy6ej51wdVEmFKE5y12nKVA@mail.gmail.com>
	<90d7f4e2-5b44-34ad-6403-d843e244299b@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 8 Jan 2018 18:20:59 -0500
Message-ID: <CADkTA4Oxu+kDQEsjidRsGT_hXZvR5D3FAYoQZzVrrS_26-sYXQ@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Yocto vrs K.O kernel, wireguard go Boom
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
X-List-Received-Date: Mon, 08 Jan 2018 23:20:59 -0000
Content-Type: multipart/alternative; boundary="089e0822fce414b52b05624c0d6f"

--089e0822fce414b52b05624c0d6f
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 8, 2018 at 4:57 PM, akuster808 <akuster808@gmail.com> wrote:

>
>
> On 01/08/2018 08:01 AM, Bruce Ashfield wrote:
>
>
>
> On Mon, Jan 8, 2018 at 10:08 AM, akuster808 <akuster808@gmail.com> wrote:
>
>> Hello,
>>
>> Wireguard in meta-networking is failing do to compat.h issues on newer
>> kernels. I have updated the package and it fixed  my problem on 4.14 K.O
>> kernel. Now I build it with the Yocko 4.12 and it fails. It wont fail with
>> a 4.12 K.O kernel. The is one commit that was backported from 4.13 K.O to
>> yocto 4.12 which is causing the issue.
>>
>> random: add get_random_{bytes,u32,u64,int,long,once}_wait family
>>
>> 6e4990d8d226e1861a5a2b632cf93bc70feab3af
>> <http://git.yoctoproject.org/cgit/cgit.cgi/linux-yocto-4.12/commit/include/linux/random.h?h=standard/base&id=6e4990d8d226e1861a5a2b632cf93bc70feab3af>
>>
>>
>>
> If you try the 4.9 kernel, does it also have issues ? Either way, it is
> likely just a -stable
> fix that hasn't made it into our 4.12 maintenance cycle yet, and that is
> something we
> can fix by adding anything that is required to get things building again.
>
> But knowing the 4.9 status would be a good data point, since I have more
> -stable
> updates queued (and not sent).
>
> 4.9 works fine with current wireguard and updated version.
>

ok. Thanks for doing that test. I'll do a check of the two -stable queues
and see what's up.

Bruce


>
> - armin
>
> So if it blows up, and then doesn't with AUTOREV,
> we have a small set of commits to look at.
>
> Bruce
>
>
>>
>>  I know Yocto is maintaining the 4.12 beyond the K.O release process so I
>> don't know if this a kernel bug or if I need to come up with some other
>> solution.
>>
>>
>> regards,
>> Armin
>>
>>
>>
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await thee
> at its end"
>
>
>


-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--089e0822fce414b52b05624c0d6f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Mon, Jan 8, 2018 at 4:57 PM, akuster808 <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:akuster808@gmail.com" target=3D"_blank">akuster808@gmail.com</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
 =20
   =20
 =20
  <div text=3D"#000000" bgcolor=3D"#FFFFFF"><span class=3D"">
    <p><br>
    </p>
    <br>
    <div class=3D"m_5081809000276030668moz-cite-prefix">On 01/08/2018 08:01=
 AM, Bruce Ashfield
      wrote:<br>
    </div>
    <blockquote type=3D"cite">
      <div dir=3D"ltr"><br>
        <div class=3D"gmail_extra"><br>
          <div class=3D"gmail_quote">On Mon, Jan 8, 2018 at 10:08 AM,
            akuster808 <span dir=3D"ltr">&lt;<a href=3D"mailto:akuster808@g=
mail.com" target=3D"_blank">akuster808@gmail.com</a>&gt;</span>
            wrote:<br>
            <blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">
              <div text=3D"#000000" bgcolor=3D"#FFFFFF">
                <p>Hello,</p>
                <p>Wireguard in meta-networking is failing do to
                  compat.h issues on newer kernels. I have updated the
                  package and it fixed=C2=A0 my problem on 4.14 K.O kernel.
                  Now I build it with the Yocko 4.12 and it fails. It
                  wont fail with a 4.12 K.O kernel. The is one commit
                  that was backported from 4.13 K.O to yocto 4.12 which
                  is causing the issue.<br>
                </p>
                <p>random: add get_random_{bytes,u32,u64,int,<wbr>long,once=
}_wait
                  family</p>
                <table summary=3D"commit info" class=3D"m_50818090002760306=
68m_-8118685174776223369commit-info">
                  <tbody>
                    <tr>
                      <th><br>
                      </th>
                      <td colspan=3D"2" class=3D"m_5081809000276030668m_-81=
18685174776223369sha1"><a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi=
/linux-yocto-4.12/commit/include/linux/random.h?h=3Dstandard/base&amp;id=3D=
6e4990d8d226e1861a5a2b632cf93bc70feab3af" target=3D"_blank">6e4990d8d226e18=
61a5a2b632cf93b<wbr>c70feab3af</a></td>
                    </tr>
                  </tbody>
                </table>
                <br>
                <table summary=3D"commit info" class=3D"m_50818090002760306=
68m_-8118685174776223369commit-info">
                  <tbody>
                    <tr>
                      <th><br>
                      </th>
                      <td colspan=3D"2" class=3D"m_5081809000276030668m_-81=
18685174776223369sha1"><br>
                      </td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </blockquote>
            <div><br>
            </div>
            <div>If you try the 4.9 kernel, does it also have issues ?
              Either way, it is likely just a -stable</div>
            <div>fix that hasn&#39;t made it into our 4.12 maintenance cycl=
e
              yet, and that is something we</div>
            <div>can fix by adding anything that is required to get
              things building again.</div>
            <div><br>
            </div>
            <div>But knowing the 4.9 status would be a good data point,
              since I have more -stable=C2=A0</div>
            <div>updates queued (and not sent). </div>
          </div>
        </div>
      </div>
    </blockquote></span>
    4.9 works fine with current wireguard and updated version.<br></div></b=
lockquote><div><br></div><div>ok. Thanks for doing that test. I&#39;ll do a=
 check of the two -stable queues and see what&#39;s up.</div><div><br></div=
><div>Bruce</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div tex=
t=3D"#000000" bgcolor=3D"#FFFFFF">
    <br>
    - armin<span class=3D""><br>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div class=3D"gmail_extra">
          <div class=3D"gmail_quote">
            <div>So if it blows up, and then doesn&#39;t with AUTOREV,</div=
>
            <div>we have a small set of commits to look at.</div>
            <div><br>
            </div>
            <div>Bruce</div>
            <div>=C2=A0</div>
            <blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">
              <div text=3D"#000000" bgcolor=3D"#FFFFFF"> <br>
                =C2=A0I know Yocto is maintaining the 4.12 beyond the K.O
                release process so I don&#39;t know if this a kernel bug or
                if I need to come up with some other solution.<br>
                <br>
                <br>
                regards,<br>
                Armin<br>
                <br>
                <br>
                <br>
              </div>
              <br>
              --<br>
              ______________________________<wbr>_________________<br>
              Openembedded-core mailing list<br>
              <a href=3D"mailto:Openembedded-core@lists.openembedded.org" t=
arget=3D"_blank">Openembedded-core@lists.openem<wbr>bedded.org</a><br>
              <a href=3D"http://lists.openembedded.org/mailman/listinfo/ope=
nembedded-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembed=
ded.org/<wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
              <br>
            </blockquote>
          </div>
          <br>
          <br clear=3D"all">
          <div><br>
          </div>
          -- <br>
          <div class=3D"m_5081809000276030668gmail_signature" data-smartmai=
l=3D"gmail_signature">&quot;Thou
            shalt not follow the NULL pointer, for chaos and madness
            await thee at its end&quot;</div>
        </div>
      </div>
    </blockquote>
    <br>
  </span></div>

</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Thou shalt no=
t follow the NULL pointer, for chaos and madness await thee at its end&quot=
;</div>
</div></div>

--089e0822fce414b52b05624c0d6f--
