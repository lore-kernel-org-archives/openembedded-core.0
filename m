Received: from mail-gg0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <giuseppe.condorelli@gmail.com>) id 1Sa6p1-0000jF-0V
	for openembedded-core@lists.openembedded.org;
	Thu, 31 May 2012 16:57:55 +0200
Received: by ggnp4 with SMTP id p4so877470ggn.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 May 2012 07:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=q0MHJFfvASTqdvdEox00Zm6x042iQv/bJvXjUZLmKK4=;
	b=PkKHmf7Oz8i0ahMGEmJGWtuHsHunbxFNLdUe2uWa8cuZv1FmmgIMTGmOG1vFgOvNeG
	O1TszWuGhqbM/L7I3Em8eXF49Y5c36zyMjAem0GmEgbJou2IKwQRbXOTtW45+N4exMTm
	Hmw7zZGn4fW+4BE52vtlpG7M2x80h0YEjO7OnfWnSkWRgCSN3WCrfub6VpZeeUu46Md5
	DtYXmVB1fOfdXJ6KV84M3aTqcbTN0J8Gd4dN1ow+eRmom1EIIvcdhJ2KaaGY27u7nipI
	3slm2u3M+zesFxir2QXdJ4ytcpHQ2vJJtS5/l7jWuj6E2QQnwpCHqTw7vDvDm2OwRn3r
	cDkA==
MIME-Version: 1.0
Received: by 10.50.202.100 with SMTP id kh4mr2022434igc.43.1338475654122; Thu,
	31 May 2012 07:47:34 -0700 (PDT)
Received: by 10.231.233.196 with HTTP; Thu, 31 May 2012 07:47:34 -0700 (PDT)
In-Reply-To: <4FC7818E.3030704@mlbassoc.com>
References: <CAOHjBZsptjefvQA3od1HV4s_fVcoHidWs5qUm-2A5+Fr9ZrRLg@mail.gmail.com>
	<CAMKF1spunqV3__K7_jEt5oQwg=J0v+TwZSUtGOv=DeipCPkzSA@mail.gmail.com>
	<CAOHjBZv9jC9pVwxS9CCjvY0wFo8_9sOaFeUQwMxPEuF8EJDuiA@mail.gmail.com>
	<CAOHjBZvGY9BWkyS+9V4OtGFcQpCC2SdzKwG9pQ0wq_oeqU=uTw@mail.gmail.com>
	<CAMKF1so8aA=s7wfo9k9wGNSwyuGYXmd5Ec9x=5Bp0YJbaiJoFA@mail.gmail.com>
	<CAOHjBZvZmXugpmxypMamZbm1LYdOqTAp4Z+1CBPn1DyohjO3Yw@mail.gmail.com>
	<4FC7818E.3030704@mlbassoc.com>
Date: Thu, 31 May 2012 16:47:34 +0200
Message-ID: <CAOHjBZsD06ABMP5VRRcmXd-8jiF7VDD=UJUrswPJyGDqObPV2Q@mail.gmail.com>
From: Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: target rpm build failure
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 31 May 2012 14:57:55 -0000
Content-Type: multipart/alternative; boundary=f46d04478855e78bbb04c1562501

--f46d04478855e78bbb04c1562501
Content-Type: text/plain; charset=ISO-8859-1

because the current distribution I manage (not oe based) is rpm based so in
my intention I want to furnish (for a while) both installtion methods: via
oe build system and via rpm (chrooted or similar).
And to do the second I need to have the possibility to access to the dbpath
oe build system manages during image cretion/installation.
Adding "package-management" to IMAGE_FEATURES I'll have this available. But
it includes also target rpm build (honestly I don't need it) that is
failing.

Have new suggestions?
Many thanks,
Giuseppe

2012/5/31 Gary Thomas <gary@mlbassoc.com>

> On 2012-05-31 07:57, Giuseppe Condorelli wrote:
>
>> Thanks for the reply,
>> unfortunately I depend from rpm, I need just rpm packages.
>>
>
> Why do you need RPM?
>
>  So can you confirm the target rpm for uclibc is not building?
>> Thanks again,
>> Giuseppe
>>
>> 2012/5/31 Khem Raj <raj.khem@gmail.com <mailto:raj.khem@gmail.com>>
>>
>>
>>    On Thu, May 31, 2012 at 5:35 AM, Giuseppe Condorelli
>>    <giuseppe.condorelli@gmail.com <mailto:giuseppe.condorelli@**gmail.com<giuseppe.condorelli@gmail.com>>>
>> wrote:
>>    >  Is there some difference for uclibc? Please let me know.
>>
>>    opkg works well with uclibc based systems. Those functions are not
>>    implemented in uclibc I am sure it can be fixed
>>    by linking in other libs or may be creating one. However if you are
>>    not bound to rpm then I would suggest to use opkg
>>
>>    in your local.conf set it
>>
>>    PACKAGE_CLASSES = "package_ipk"
>>
>
> --
> ------------------------------**------------------------------
> Gary Thomas                 |  Consulting for the
> MLB Associates              |    Embedded world
> ------------------------------**------------------------------
>
>
> ______________________________**_________________
> Openembedded-core mailing list
> Openembedded-core@lists.**openembedded.org<Openembedded-core@lists.openembedded.org>
> http://lists.linuxtogo.org/**cgi-bin/mailman/listinfo/**openembedded-core<http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>
>

--f46d04478855e78bbb04c1562501
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div>because the current distribution I manage (not oe based) is rpm based =
so in my intention I want to furnish (for a while) both installtion methods=
: via oe build system and via rpm (chrooted or similar).</div><div>And to d=
o the second I need to have the possibility to access to the dbpath oe buil=
d system manages during image cretion/installation.</div>
<div>Adding &quot;package-management&quot; to IMAGE_FEATURES I&#39;ll have =
this available. But it includes also target rpm build (honestly I don&#39;t=
 need it) that is failing.</div><div>=A0</div><div>Have new suggestions?</d=
iv>
<div>Many thanks,</div><div>Giuseppe<br><br></div><div class=3D"gmail_quote=
">2012/5/31 Gary Thomas <span dir=3D"ltr">&lt;<a href=3D"mailto:gary@mlbass=
oc.com" target=3D"_blank">gary@mlbassoc.com</a>&gt;</span><br><blockquote s=
tyle=3D"margin:0px 0px 0px 0.8ex;padding-left:1ex;border-left-color:rgb(204=
,204,204);border-left-width:1px;border-left-style:solid" class=3D"gmail_quo=
te">
<div class=3D"im">On 2012-05-31 07:57, Giuseppe Condorelli wrote:<br>
<blockquote style=3D"margin:0px 0px 0px 0.8ex;padding-left:1ex;border-left-=
color:rgb(204,204,204);border-left-width:1px;border-left-style:solid" class=
=3D"gmail_quote">
Thanks for the reply,<br>
unfortunately I depend from rpm, I need just rpm packages.<br>
</blockquote>
<br></div>
Why do you need RPM?<br>
<br>
<blockquote style=3D"margin:0px 0px 0px 0.8ex;padding-left:1ex;border-left-=
color:rgb(204,204,204);border-left-width:1px;border-left-style:solid" class=
=3D"gmail_quote"><div class=3D"im">
So can you confirm the target rpm for uclibc is not building?<br>
Thanks again,<br>
Giuseppe<br>
<br></div>
2012/5/31 Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_bla=
nk">raj.khem@gmail.com</a> &lt;mailto:<a href=3D"mailto:raj.khem@gmail.com"=
 target=3D"_blank">raj.khem@gmail.com</a>&gt;&gt;<div class=3D"im"><br>
<br>
 =A0 =A0On Thu, May 31, 2012 at 5:35 AM, Giuseppe Condorelli<br></div><div =
class=3D"im">
 =A0 =A0&lt;<a href=3D"mailto:giuseppe.condorelli@gmail.com" target=3D"_bla=
nk">giuseppe.condorelli@gmail.com</a> &lt;mailto:<a href=3D"mailto:giuseppe=
.condorelli@gmail.com" target=3D"_blank">giuseppe.condorelli@<u></u>gmail.c=
om</a>&gt;&gt; wrote:<br>

 =A0 =A0&gt; =A0Is there some difference for uclibc? Please let me know.<br=
>
<br>
 =A0 =A0opkg works well with uclibc based systems. Those functions are not<=
br>
 =A0 =A0implemented in uclibc I am sure it can be fixed<br>
 =A0 =A0by linking in other libs or may be creating one. However if you are=
<br>
 =A0 =A0not bound to rpm then I would suggest to use opkg<br>
<br>
 =A0 =A0in your local.conf set it<br>
<br>
 =A0 =A0PACKAGE_CLASSES =3D &quot;package_ipk&quot;<br>
</div></blockquote><span class=3D"HOEnZb"><font color=3D"#888888">
<br>
-- <br>
------------------------------<u></u>------------------------------<br>
Gary Thomas =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0Consulting for the<br>
MLB Associates =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =A0Embedded world<br>
------------------------------<u></u>------------------------------</font><=
/span><div class=3D"HOEnZb"><div class=3D"h5"><br>
<br>
______________________________<u></u>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.<u></u>openembedded.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/<u></u>cgi-bin/mailman/=
listinfo/<u></u>openembedded-core</a><br>
</div></div></blockquote></div><br>

--f46d04478855e78bbb04c1562501--
