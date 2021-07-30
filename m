Subject: Re: SYSROOTS_EXCLUDEDEPS_SYSROOT changing more hashes than I expect
To: openembedded-core@lists.openembedded.org
From: "Jate Sujjavanich" <jatedev@gmail.com>
X-Originating-Location: Tallahassee, Florida, US (63.148.217.19)
X-Originating-Platform: Mac Firefox 89
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 30 Jul 2021 09:04:15 -0700
References: <e3f3675380a84f3c726f8238707653fbaad1136a.camel@linuxfoundation.org>
In-Reply-To: <e3f3675380a84f3c726f8238707653fbaad1136a.camel@linuxfoundation.org>
Message-ID: <7639.1627661055320457660@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="pefdgqPTlIEl9OZ8quMi"

--pefdgqPTlIEl9OZ8quMi
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The ones in meta/conf/layer.conf are much more global. This one in meta-jav=
a/conf/layer.conf certainly does not apply to perl and other irrelevant rec=
ipes.

SSTATE_EXCLUDEDEPS_SYSROOT +=3D "\
   openjdk-8-native->(ant-native|attr-native|coreutils-native|icedtea7-nat=
ive|libxslt-native|make-native|openssl-native|zip-native|unzip-native) \
"
Do you have a recommendation on how to apply this strictly within meta-jav=
a? The only way I can think of is to move the EXCLUDEDEPS to the specific r=
ecipe(s). Are there any other good ways?

- Jate S.

--pefdgqPTlIEl9OZ8quMi
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The ones in meta/conf/layer.conf are much more global. This one in meta-jav=
a/conf/layer.conf certainly does not apply to perl and other irrelevant rec=
ipes.<br /><br />
<pre><code>SSTATE_EXCLUDEDEPS_SYSROOT +=3D "\
    openjdk-8-native-&gt;(ant-native|attr-native|coreutils-native|icedtea7=
-native|libxslt-native|make-native|openssl-native|zip-native|unzip-native) =
\
"</code></pre>
<br />Do you have a recommendation on how to apply this strictly within me=
ta-java? The only way I can think of is to move the EXCLUDEDEPS to the spec=
ific recipe(s). Are there any other good ways?<br /><br />- Jate S.

--pefdgqPTlIEl9OZ8quMi--
