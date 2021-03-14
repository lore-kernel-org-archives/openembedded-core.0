Subject: sstate mirroring between different host OSes requires pre-building pseudo-native
To: openembedded-core@lists.openembedded.org
From: "Matt Madison" <matt@madison.systems>
X-Originating-Location: Santa Cruz, California, US (76.209.242.28)
X-Originating-Platform: Linux Chrome 89
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Sun, 14 Mar 2021 06:45:15 -0700
Message-ID: <hx4N.1615729515427076467.TVRw@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="8WpYn7RHEjlUnvLpjpar"

--8WpYn7RHEjlUnvLpjpar
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

I run my CI autobuilders on Ubuntu 20.04 servers, which generate sstate tha=
t I mirror out to my development machine, which runs Ubuntu 20.10. That use=
d to work fine - everything would setscene in as expected. For some time no=
w, though, I see just about everything setscene in, and then everything als=
o gets rebuilt from scratch again.=C2=A0 I'm not sure if this dates back to=
 November when the change to de-universalize pseudo-native happened, or wit=
h some more recent pseudo-related changes, as I only had time to investigat=
e it this week.

If I bitbake pseudo-native first so it's at least in my local sstate-cache=
, then everything works as expected again. It's only if pseudo has to be bu=
ilt from scratch that I get the rebuild cascade. I thought this might be du=
e to my distro setup, but it's easily reproducible with a stock poky setup.

Is this the expected behavior now?

Thanks,
-Matt

--8WpYn7RHEjlUnvLpjpar
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

I run my CI autobuilders on Ubuntu 20.04 servers, which generate sstate tha=
t I mirror out to my development machine, which runs Ubuntu 20.10. That use=
d to work fine - everything would setscene in as expected. For some time no=
w, though, I see just about everything setscene in, and then everything als=
o gets rebuilt from scratch again.&nbsp; I'm not sure if this dates back to=
 November when the change to de-universalize pseudo-native happened, or wit=
h some more recent pseudo-related changes, as I only had time to investigat=
e it this week.<br /><br />If I bitbake pseudo-native first so it's at leas=
t in my local sstate-cache, then everything works as expected again. It's o=
nly if pseudo has to be built from scratch that I get the rebuild cascade. =
I thought this might be due to my distro setup, but it's easily reproducibl=
e with a stock poky setup.<br /><br />Is this the expected behavior now?<br=
 /><br />Thanks,<br />-Matt

--8WpYn7RHEjlUnvLpjpar--
