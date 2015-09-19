Return-Path: <mike.looijmans@topic.nl>
Received: from smtp02.mail.online.nl (smtp02.mail.online.nl [194.134.25.72])
	by mail.openembedded.org (Postfix) with ESMTP id 374FB65D00
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Sep 2015 12:07:37 +0000 (UTC)
Received: from [192.168.1.5] (s55969068.adsl.online.nl [85.150.144.104])
	by smtp02.mail.online.nl (Postfix) with ESMTP id 57C791A0041
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Sep 2015 14:07:36 +0200 (CEST)
Message-ID: <55FD5008.1050906@topic.nl>
Date: Sat, 19 Sep 2015 14:07:36 +0200
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: Topic
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
Subject: bitbake: Missing 'import errno' in git.py
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
X-List-Received-Date: Sat, 19 Sep 2015 12:07:41 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

I think there's an "import errno" missing in the file. Anyone already 
aware of this, or should I make a patch?

File: '.../bitbake/lib/bb/fetch2/git.py', lineno: 224, function: download
      0220:            runfetchcmd("%s pack-redundant --all | xargs -r 
rm" % ud.basecmd, d)
      0221:            try:
      0222:                os.unlink(ud.fullmirror)
      0223:            except OSError as exc:
  *** 0224:                if exc.errno != errno.ENOENT:
      0225:                    raise
      0226:        os.chdir(ud.clonedir)
      0227:        for name in ud.names:
      0228:            if not self._contains_ref(ud, d, name):
Exception: NameError: global name 'errno' is not defined

-- 
Mike Looijmans

