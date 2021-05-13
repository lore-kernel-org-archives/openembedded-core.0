Subject: Re: master/main branch renaming and bitbake
To: openembedded-core@lists.openembedded.org
From: "Benjamin Gilbert" <bgilbert@backtick.net>
X-Originating-Location: New York, New York, US (98.7.211.151)
X-Originating-Platform: Linux Firefox 88
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 13 May 2021 13:34:45 -0700
References: <CANNYZj9K2m7ucmPihEzSyjXw7Cno-cnX9jgzP081-VeObbmJmg@mail.gmail.com>
In-Reply-To: <CANNYZj9K2m7ucmPihEzSyjXw7Cno-cnX9jgzP081-VeObbmJmg@mail.gmail.com>
Message-ID: <18445.1620938085981224859@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="nnsebqiqmoQqN5ozQWzm"

--nnsebqiqmoQqN5ozQWzm
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 13, 2021 at 01:07 PM, Alexander Kanavin wrote:

>=20
> It's not that different from deleting or archiving old tarball downloads=
 -
> yes it keeps things clean and tidy for upstream, but it will break
> someone's automated build that way, no matter how obsolete the code bein=
g
> downloaded.
>=20

Tarballs, commits on published branches, and annotated tags are all suppos=
ed to be stable artifacts.=C2=A0 But I don't know of any general expectatio=
n that a specific branch continues to exist, other than the one created by =
Bitbake.=C2=A0 GitHub's branch rename tool doesn't leave the old branch beh=
ind, not even a symref, so I don't think this is a fringe viewpoint.=C2=A0 =
And as I said, automated builds usually only care about tags, commits, and =
the default branch.

I genuinely appreciate the discussion, all.=C2=A0 In the two upstream proj=
ects I mentioned, I'm going to recommend that we re-delete the master branc=
hes after a reasonable migration period has elapsed.

Best,
--Benjamin Gilbert

--nnsebqiqmoQqN5ozQWzm
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 13, 2021 at 01:07 PM, Alexander Kanavin wrote:<br />
<blockquote>
<div>It's not that different from deleting or archiving old tarball downlo=
ads -&nbsp; yes it keeps things clean and tidy for upstream, but it will br=
eak someone's automated build that way, no matter how obsolete the code bei=
ng downloaded.</div>
</blockquote>
Tarballs, commits on published branches, and annotated tags are all suppos=
ed to be stable artifacts.&nbsp; But I don't know of any general expectatio=
n that a specific branch continues to exist, other than the one created by =
Bitbake.&nbsp; GitHub's branch rename tool doesn't leave the old branch beh=
ind, not even a symref, so I don't think this is a fringe viewpoint.&nbsp; =
And as I said, automated builds usually only care about tags, commits, and =
the default branch.<br /><br />I genuinely appreciate the discussion, all.&=
nbsp; In the two upstream projects I mentioned, I'm going to recommend that=
 we re-delete the master branches after a reasonable migration period has e=
lapsed.<br /><br />Best,<br />--Benjamin Gilbert

--nnsebqiqmoQqN5ozQWzm--
