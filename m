Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
	[209.85.221.49])
	by mail.openembedded.org (Postfix) with ESMTP id 9C0987F7AA
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Nov 2019 23:17:58 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id z7so12011994wrl.13
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Nov 2019 15:18:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=VUvqitnQlTIkRRfBaDDRJyzWUup2vBmCnBkFN+NwX7A=;
	b=RUQP1zLt6DeIH99l+YpHtRA9Kh1yrFGpho9Gm+ng7fK3BAPkeQJLL9J7Vtkn8Rd4Gt
	npc0fAU7YlwM0/PVNIfwMx+2CrnI7ia6IYCKtdrZoTJ3mdpfAwmdMwfBST2aumn6I/Vz
	2V9H0QTZuIu4GfQh0+sYY7irE91IVM5igugCc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=VUvqitnQlTIkRRfBaDDRJyzWUup2vBmCnBkFN+NwX7A=;
	b=hbsJnBdgaLGVZsP//x68pqYyhXPcvV2g/kmF16wr0z46/fMNRY9qQMmwYKtwf8DJej
	lrVp4p90btX8T4bgRs4XZrNGeVafHDaFIOsBd4ERO/lpjXQxPd8Pysfj2YYjFRE9Dg6B
	IPoisiKyKx1IkmpXmYP2DShw90SCegY6wozBs+qKZUiRcq1tWn0xs36BNLboqExT6Zny
	XyQZijbtFcHHjum92YcNp4BUME93WJ9gvQ3Xmc/GCVFqygOUhhI6Np8Wa2bG/rLu32eR
	mv2SeJL5385v5o1eFBFKS3giPGaK3uv2SvvPr9XYw63j1dvu2iXBwsEYTqTM/tkgYk4C
	rbVg==
X-Gm-Message-State: APjAAAU6XlTYU88UJvNnXCAqYrQfNRjbpABejqYFnJg4iaExUvP4clVH
	2U7LhbKcS+M+WEymsxdwl/SK9A==
X-Google-Smtp-Source: APXvYqyouFJOmMk4eIAowmKLrznncOYIA/plmc3Als3++cEtUjqv8MfIDvFnl/Y20WPdKtaduUe/Lw==
X-Received: by 2002:a5d:49cf:: with SMTP id t15mr20307121wrs.183.1574637479021;
	Sun, 24 Nov 2019 15:17:59 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id z2sm8053308wrs.89.2019.11.24.15.17.58
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 24 Nov 2019 15:17:58 -0800 (PST)
Message-ID: <d41e19af4eebc30cee6e847e367b34411de46346.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Joshua Watt <jpewhacker@gmail.com>
Date: Sun, 24 Nov 2019 23:17:57 +0000
In-Reply-To: <CAJdd5Gb=umP9TssH2+SnbbogDYhdTmRDsiz=thp_buVz5wJk5A@mail.gmail.com>
References: <559334b39f154c70d868dce6067984298976d841.camel@linuxfoundation.org>
	<CAJdd5Gb=umP9TssH2+SnbbogDYhdTmRDsiz=thp_buVz5wJk5A@mail.gmail.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Hash Equiv rehash problems
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
X-List-Received-Date: Sun, 24 Nov 2019 23:17:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2019-11-24 at 14:51 -0600, Joshua Watt wrote:
> What this means is that gdb-cross changes the sstate hash of meta-
> > extsdk-toolchain:do_* as it found an equiv match but those
> > artefacts
> > were never generated. That hash was written into the eSDK sigs but
> > it
> > isn't present in sstate.
> 
> So, to summarize and make sure I understand: The eSDK built with hash
> equivalence enabled doesn't function because it is looking for sstate
> object that do not exist?

Correct.

Its easy to say "that is an SDK problem" however the other case I
mentioned "bitbake X; bitbake X" rebuilding a load of things bothers me
a lot more.

> I'm not very familiar with the eSDK, but it doesn't surprise me too
> much; the locking mechanism used by the eSDK (at least the little I
> understand), has some overlap with hash equivalence, so it seems like
> they might not play nice together.

Its only a symptom of the bigger problem though and just an easier way
to see what is breaking.

> > I did put a comment in runqueue.py a while back:
> > 
> > # Potentially risky, should we report this hash as a match?
> > logger.info("Already covered setscene for %s so ignoring rehash" %
> > (tid))
> > 
> > and it does re-raise this question.
> > 
> > There may be two possible fixes:
> > 
> > a) We force setscene tasks which have already run to rerun if this
> > kind
> > of rehash happens. We did previously do this but runqueue *really*
> > doesn't like rerunning setscene tasks.
> 
> Do we remember why this is the case? I know we've talked about it off
> and on, but I don't think we've ever listed out the specific reasons
> why this doesn't work.
> 
> I do know that one of the reasons was that it isn't possible to
> transition a task from being covered by sstate to being uncovered,
> because there might be dependent tasks that were completely skipped
> when the task was restored from sstate (e.g. do_fetch, do_unpack,
> do_compile, do_install might all get skipped if do_package_setscene
> is
> run).
> 
> Are there other reasons?

I have to admit I don't fully remember the reasons why we went this way
but it was something along the lines of rerunning a setscene multiple
times in a given build got ugly. Once a setscene has run, other things
can run which depend on it and if we then go back and re-run it, what
else do we have to rerun.

Put another way, we execute the two different task graphs in opposite
directions. Rerunning setscenes that already executed just complicates
the graph to the point you can't figure out what to execute.

> > b) We report these 'additional' equivalences to the server
> 
> I'll admit, this never sat well with me. I couldn't ever prove why
> this was "correct" (or, it has been shown to me and I didn't
> understand :/ ). From a theoretical standpoint, it seems like
> reporting these hashes as equivalent would be wrong since I'm not
> necessarily sure we can say that the task would reproduce in an
> equivalent manner.

First, I think I should explain exactly how this is breaking as it was
a puzzle to me until I just worked it out.

meta-extsdk-toochain depends on gdb-cross.

gdb-cross runs on the native architecture. On an x86 worker its an x86
binary, on an arm server its an arm binary. We have both servers in our
cluster.

sstate handles this fine by having the arch in the artefact name.

This means you have the same input hash generating two different binary
artefacts depending upon which arch it was built upon. When you realise
that, you start to see where/why this breaks.

meta-extsdk-toolchain builds on one kind of server and hashes go into
hash equiv, artefacts to sstate.

When the next build happens on a different native architecture, the
sstate artefacts are valid for meta-extsdk-toolchain but the gdb-cross
are not. gdb-cross therefore rebuilds which then gets a new hash which
then changes the hashes for meta-extsdk-toolchain, invalidating the
original artefacts.

The outhash for native binaries on two different arches will never
match. sstate assumes we can make the hashes match though.

>  The implementation of this would, I think, agree
> with me since the best mechanisms I can think of to implement this on
> the server side aren't particularly pretty :(.

I tried mocking up a patch, included at the end below. Its wrong in
that it tries to inject duplicate entries, it needs to check and just
return if it would do that. I've run out of time/energy to fix it
further tonight but it shows what I'm thinking.

> However, I do think it's possible I'm just missing something, and
> this isn't as bad as I think.

Maybe, maybe not.

> > We are seeing other symptoms of this "rehashing" in builds where
> > "bitbake X; bitbake X" will suddenly rebuild a load of stuff in the
> > second build as it didn't build it originally due to the "ignoring
> > rehash" messages. This is very counter-intuitive and effectively a
> > different representation of the same bug. Its less problematic
> > since we
> > just rebuild things (eSDK can't).
> > 
> > If we decide b) is correct, it also raises an interesting scope
> > question. Should we:
> > 
> > a) only report things we've run into in real builds
> 
> This would effectively mean only reporting equivalence when we would
> print the log message "Already covered setscene..."?

Yes, see the patch below as this implements that.

> > b) report all hashes (there'd be loads)
> 
> I'm not quite clear on how this would work, can you elaborate?

Every time the server rehashes there are new hash combinations found.
We could argue many are equivalent. We don't want to pollute the
database with all of them though.

> > c) report all hashes which are present in sstate
> 
> I'm also not sure how this one would work, can your provide more
> detail?

In light of my above analysis this doesn't make so much sense.

> > ?
> > 
> > I think I need to sit and think about this for a while. Ccing
> > Joshua in
> > case he has any insights into this...
> > 
> > We can't enable hashequiv by default until we get this fixed
> > somehow.

Patch for adding equiv mapping support to the server follows. Its
currently broken as I mention above but shows its at least possible.

Basic idea is to search on the old hash to get the outhash, then mark
the new hash as equivalent to that outhash.

Cheers,

Richard

diff --git a/bitbake/lib/bb/runqueue.py b/bitbake/lib/bb/runqueue.py
index 485d9341f55..09767a4b88f 100644
--- a/bitbake/lib/bb/runqueue.py
+++ b/bitbake/lib/bb/runqueue.py
@@ -1718,6 +1718,7 @@ class RunQueueExecute:
         self.sq_deferred = {}
 
         self.stampcache = {}
+        self.rehashes = {}
 
         self.holdoff_tasks = set()
         self.holdoff_need_update = True
@@ -2286,7 +2287,8 @@ class RunQueueExecute:
                         self.rqdata.runtaskentries[tid].hash = bb.parse.siggen.get_taskhash(tid, procdep, self.rqdata.dataCaches[mc_from_tid(tid)])
                         origuni = self.rqdata.runtaskentries[tid].unihash
                         self.rqdata.runtaskentries[tid].unihash = bb.parse.siggen.get_unihash(tid)
-                        logger.debug(1, "Task %s hash changes: %s->%s %s->%s" % (tid, orighash, self.rqdata.runtaskentries[tid].hash, origuni, self.rqdata.runtaskentries[tid].unihash))
+                        self.rehashes[tid] = origuni
+                        #logger.info("Task %s hash changes: %s->%s %s->%s" % (tid, orighash, self.rqdata.runtaskentries[tid].hash, origuni, self.rqdata.runtaskentries[tid].unihash))
                         next |= self.rqdata.runtaskentries[tid].revdeps
                         changed.add(tid)
                         total.remove(tid)
@@ -2314,7 +2320,8 @@ class RunQueueExecute:
 
             if tid in self.scenequeue_covered or tid in self.sq_live:
                 # Already ran this setscene task or it running
-                # Potentially risky, should we report this hash as a match?
+                # Potentially risky, should we report this hash as a match
+                bb.parse.siggen.report_unihash_equiv(tid, self.rehashes[tid], self.rqdata.runtaskentries[tid].unihash)
                 logger.info("Already covered setscene for %s so ignoring rehash" % (tid))
                 self.pending_migrations.remove(tid)
                 continue
diff --git a/bitbake/lib/bb/siggen.py b/bitbake/lib/bb/siggen.py
index a4bb1ff7fbe..8080159044e 100644
--- a/bitbake/lib/bb/siggen.py
+++ b/bitbake/lib/bb/siggen.py
@@ -524,6 +524,14 @@ class SignatureGeneratorUniHashMixIn(object):
                 except OSError:
                     pass
 
+    def report_unihash_equiv(self, tid, unihash, newunihash):
+        try:
+            extra_data = {}
+            data = self.client().report_unihash_equiv(newunihash, self.method, unihash, extra_data)
+            bb.warn('Reported task %s as unihash %s to %s (%s)' % (tid, newunihash, self.server, str(data)))
+
+        except hashserv.client.HashConnectionError as e:
+            bb.warn('Error contacting Hash Equivalence Server %s: %s' % (self.server, str(e)))
 
 #
 # Dummy class used for bitbake-selftest
diff --git a/bitbake/lib/hashserv/client.py b/bitbake/lib/hashserv/client.py
index f65956617b9..ae0cce9df4f 100644
--- a/bitbake/lib/hashserv/client.py
+++ b/bitbake/lib/hashserv/client.py
@@ -148,6 +148,14 @@ class Client(object):
         m['unihash'] = unihash
         return self.send_message({'report': m})
 
+    def report_unihash_equiv(self, taskhash, method, unihash, extra={}):
+        self._set_mode(self.MODE_NORMAL)
+        m = extra.copy()
+        m['taskhash'] = taskhash
+        m['method'] = method
+        m['unihash'] = unihash
+        return self.send_message({'report-equiv': m})
+
     def get_stats(self):
         self._set_mode(self.MODE_NORMAL)
         return self.send_message({'get-stats': None})
diff --git a/bitbake/lib/hashserv/server.py b/bitbake/lib/hashserv/server.py
index 0aff77688e4..b1276dcfc5c 100644
--- a/bitbake/lib/hashserv/server.py
+++ b/bitbake/lib/hashserv/server.py
@@ -143,6 +143,7 @@ class ServerClient(object):
             handlers = {
                 'get': self.handle_get,
                 'report': self.handle_report,
+                'report-equiv': self.handle_equivreport,
                 'get-stream': self.handle_get_stream,
                 'get-stats': self.handle_get_stats,
                 'reset-stats': self.handle_reset_stats,
@@ -303,6 +304,54 @@ class ServerClient(object):
 
         self.write_message(d)
 
+    async def handle_equivreport(self, data):
+        with closing(self.db.cursor()) as cursor:
+            cursor.execute('''
+                -- Find the task entry for the matching taskhash
+                SELECT unihash, outhash FROM tasks_v2 WHERE method=:method AND taskhash=:unihash AND taskhash!=:taskhash
+
+                -- Only return one row
+                LIMIT 1
+                ''', {k: data[k] for k in ('method', 'unihash', 'taskhash')})
+
+            row = cursor.fetchone()
+
+            if row is None:
+                self.write_message(None)
+                return
+
+            insert_data = {
+                'method': data['method'],
+                'outhash': row['outhash'],
+                'taskhash': data['taskhash'],
+                'unihash': row['unihash'],
+                'created': datetime.now()
+            }
+
+            for k in ('owner', 'PN', 'PV', 'PR', 'task', 'outhash_siginfo'):
+                if k in data:
+                    insert_data[k] = data[k]
+
+            cursor.execute('''INSERT INTO tasks_v2 (%s) VALUES (%s)''' % (
+                ', '.join(sorted(insert_data.keys())),
+                ', '.join(':' + k for k in sorted(insert_data.keys()))),
+                insert_data)
+
+            self.db.commit()
+
+            logger.info('Adding taskhash equivaence for %s with unihash %s',
+                            data['taskhash'], row['unihash'])
+
+            d = {
+                'taskhash': data['taskhash'],
+                'method': data['method'],
+                'unihash': row['unihash'],
+                'outhash': row['outhash'],
+            }
+
+        self.write_message(d)
+
+
     async def handle_get_stats(self, request):
         d = {
             'requests': self.request_stats.todict(),


