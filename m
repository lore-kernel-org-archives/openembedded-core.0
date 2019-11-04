Return-Path: <douglas.royds@taitradio.com>
Received: from smtp1.taitradio.net (unknown [202.37.96.23])
	by mail.openembedded.org (Postfix) with SMTP id 6BE9F7F977
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Nov 2019 20:55:45 +0000 (UTC)
Received: from [172.16.169.141] (unknown [172.16.169.141])
	by smtp1.taitradio.net (Postfix) with ESMTP id 431EE1C0010;
	Tue,  5 Nov 2019 09:55:45 +1300 (NZDT)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
References: <20191104011638.26010-1-douglas.royds@taitradio.com>
	<20191104045245.19085-1-douglas.royds@taitradio.com>
	<d38744bdfaf4022f13f06f7ea25cf9f06b6d4844.camel@linuxfoundation.org>
From: Douglas Royds <douglas.royds@taitradio.com>
Message-ID: <0760e4bc-2819-0b99-1baa-1688e9ec232a@taitradio.com>
Date: Tue, 5 Nov 2019 09:55:45 +1300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <d38744bdfaf4022f13f06f7ea25cf9f06b6d4844.camel@linuxfoundation.org>
Subject: Re: [PATCH v2] insane: file-rdeps: Readability only
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
X-List-Received-Date: Mon, 04 Nov 2019 20:55:45 -0000
Content-Type: multipart/alternative;
	boundary="------------1AA60A4954991E48DBAABDF6"
Content-Language: en-GB

--------------1AA60A4954991E48DBAABDF6
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 4/11/19 11:29 PM, Richard Purdie wrote:

> On Mon, 2019-11-04 at 17:52 +1300, Douglas Royds via Openembedded-core
> wrote:
>> Mostly just longer (and hopefully more meaningful) variable names.
> "Mostly" - what else is in there?


Readability changes only.

 =C2=A0* Longer variable names
 =C2=A0* Reworded some comments
 =C2=A0* Some extra blank lines (as visual paragraph breaks)

I replaced this comment + hard-coded string-length:

    # We already know it starts with FILERDEPENDS_
    filerdepends[subkey] =3D key[13:]

With this one-liner:

    unsatisfied_rdepends[target_dependency] =3D
    executable_that_rdepends[len('FILERDEPENDS_'):]



--------------1AA60A4954991E48DBAABDF6
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body text=3D"#000000" bgcolor=3D"#FFFFFF">
    <p>On 4/11/19 11:29 PM, Richard Purdie wrote:
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">On Mon, 2019-11-04 at 17:5=
2 +1300, Douglas Royds via Openembedded-core
wrote:
</pre>
        <blockquote type=3D"cite">
          <pre class=3D"moz-quote-pre" wrap=3D"">Mostly just longer (and =
hopefully more meaningful) variable names.
</pre>
        </blockquote>
        <pre class=3D"moz-quote-pre" wrap=3D"">
"Mostly" - what else is in there?</pre>
      </blockquote>
    </p>
    <p><br>
    </p>
    <p>Readability changes only.<br>
    </p>
    <p>=C2=A0* Longer variable names<br>
      =C2=A0* Reworded some comments<br>
      =C2=A0* Some extra blank lines (as visual paragraph breaks)</p>
    <p>I replaced this comment + hard-coded string-length:</p>
    <blockquote>
      <p># We already know it starts with FILERDEPENDS_ <br>
        filerdepends[subkey] =3D key[13:]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <br>
      </p>
    </blockquote>
    <p>With this one-liner:</p>
    <blockquote>
      <p>unsatisfied_rdepends[target_dependency] =3D
        executable_that_rdepends[len('FILERDEPENDS_'):]<br>
      </p>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------1AA60A4954991E48DBAABDF6--
